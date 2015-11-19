require 'deep_clone'
require_relative '../helper/game_helper'
class Ai
  include GameHelper
  class << self
    attr_reader :board
    BOARD_IMPORTANCE = [
      [9999, 5, 500, 200, 200, 500, 5, 9999],
      [5, 1, 50, 150, 150, 50, 1, 5],
      [500, 50, 250, 100, 100, 250, 50, 500],
      [200, 150, 100, 50, 50, 100, 150, 200],
      [200, 150, 100, 50, 50, 100, 150, 200],
      [500, 50, 250, 100, 100, 250, 50, 500],
      [5, 1, 50, 150, 150, 50, 1, 5],
      [9999, 5, 500, 200, 200, 500, 5, 9999]
    ]

    def best_next_move(reversi, level)
      @reversi = reversi
      @player_ai = reversi.current_player
      get_best_next_move_score(level - 1, reversi)
      # if @best_next_move.count == 0
      #   binding.pry
      # end
      @best_next_move[0]
    end

    private

    def get_best_next_move_score(lvl, reversi)
      best_move = []
      bestScore = 0.0
      GameHelper.every_slot_on_boad do |row, col|
        next unless @reversi.is_move_allowed?(@player_ai, reversi.board, row, col)
        checking_board = DeepClone.clone(@reversi)
        checking_board.set_tile(row, col)
        @board = checking_board.board

        check_score = score_total

        if lvl > 0 && !checking_board.game_over?
          check_score += get_best_next_move_score(lvl - 1, checking_board)
        end

        if bestScore.nil? || is_new_extremum_depending_on_player_turn(bestScore, check_score)
          bestScore = check_score
          best_move << { row: row, col: col }
        end
      end

      @best_next_move = best_move

      fail 'move error' if bestScore.nil?
      bestScore
    end

    def is_new_extremum_depending_on_player_turn(reference_value, score)
      if @next_turn == @next_opponent
        return reference_value > score
      else
        return reference_value < score
      end
    end

    def score_total
      score_importance + score_mobility + score_potential
    end

    def score_importance
      score_importance_for(@player_ai) - 1.5 * score_importance_for(@player_human)
    end

    def score_importance_for(player)
      importance = 0
      @board.tile_positions(player).each do |position|
        importance += BOARD_IMPORTANCE[position[:row]][position[:col]]
      end
      importance
    end

    def score_mobility
      mobility_human = score_mobility_for(@player_human)
      mobility_machine = score_mobility_for(@player_ai)
      (64.0 / @board.count_all_tiles) * (3.0 * mobility_machine - 4.0 * mobility_human)
    end

    def score_mobility_for(player)
      mobility_count = 0
      GameHelper.every_slot_on_boad do |row, col|
        if @reversi.is_move_allowed?(player, @board, row, col)
          mobility_count += 1
        end
      end
      mobility_count
    end

    def score_potential
      potential_human = score_potential_for_player(@player_human)
      potential_machine = score_potential_for_player(@player_ai)
      (64.0 / (2 * @board.count_all_tiles)) * (2.5 * potential_machine - 3.0 * potential_human)
    end

    def score_potential_for_player(player)
      potential_count = 0
      opponent = Player.get_opponent_tile_for player
      @board.tile_positions(player).each do |tile|
        if @board.board[tile[:row]][tile[:col]] == opponent
          potential_count += count_surrounding_empty_slots(row, col)
        end
      end
      potential_count
    end

    def count_surrounding_empty_slots(row, col)
      empty_slot_count = 0
      GameHelper.direction_loop do |row_direction, col_direction|
        check_row = row + row_direction
        check_col = col + col_direction
        if @board.on_board? && @board.get_tile(check_row, check_col).nil?
          empty_slot_count += 1
        end
      end
      empty_slot_count
    end
  end
end
