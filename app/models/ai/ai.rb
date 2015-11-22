require 'deep_clone'
require_relative '../../helper/game_helper'
require_relative 'mobility'
require_relative 'potential'
require_relative 'importance'
class Ai
  include GameHelper
  include Mobility
  include Potential
  include Importance
  class << self
    def best_next_move(reversi, level)
      @reversi = reversi
      @player_ai = reversi.player.current
      @player_opponent = reversi.player.opponent_tile_for(@player_ai)
      get_best_next_move_score(level, reversi)
      @best_next_move[0]
    end

    private

    def get_best_next_move_score(lvl, reversi)
      best_move = []
      bestScore = nil
      GameHelper.every_slot_on_boad do |row, col|
        if reversi.is_move_allowed?(@player_ai, reversi.board, row, col)
          reversi_clone = DeepClone.clone(@reversi)
          reversi_clone.set_tile(row, col)
          @board = reversi_clone.board

          check_score = score_total

          if lvl > 0 && !reversi_clone.game_over?
            check_score += get_best_next_move_score(lvl - 1, reversi_clone)
          end

          if bestScore.nil? || is_new_extremum_depending_on_player_turn(bestScore, check_score, reversi_clone)
            bestScore = check_score
            best_move << { row: row, col: col }
          end
        end
      end

      @best_next_move = best_move

      fail 'move error' if bestScore.nil?
      bestScore
    end

    def is_new_extremum_depending_on_player_turn(reference_value, score, reversi_clone)
      if reversi_clone.possible_move_for_player?(@player_opponent)
        return reference_value > score
      else
        return reference_value < score
      end
    end

    def score_total
      Importance.score_importance(@player_ai, @player_opponent, @board) + Mobility.score_mobility(@player_ai, @player_opponent, @board, @reversi) + Potential.score_potential(@player_ai, @player_opponent, @board, @reversi)
    end
  end
end
