require_relative 'board'
require_relative 'player'
require_relative 'ai/ai'
require_relative '../helper/game_helper'

class Reversi
  include GameHelper
  attr_reader :player, :board
  def initialize
    @player = Player.new(true)
    @board = Board.new(player_one: @player.tile, player_two: @player.opponent_tile)
    @gameOver = false
    @level = 3
  end

  def move(row, col)
    if game_over?
      puts 'game over!'
    elsif is_move_allowed?(@player.tile, @board, row, col)
      set_tile(row, col)
      next_player
      return true
    else
      return false
    end
  end

  def ai_move
    move_position = Ai.best_next_move(self, 2)
    move(move_position[:row], move_position[:col])
  end

  def is_move_allowed?(player, board, row, col)
    return false unless board.set_tile_allowed?(row, col)
    GameHelper.direction_loop do |row_direction, col_direction|
      adjacent_stones = adjacent_stones(player, row, col, row_direction, col_direction)
      return true unless adjacent_stones.nil? || adjacent_stones.empty?
    end
    false
  end

  def adjacent_stones(player, row, col, row_direction, col_direction)
    check_row = row + row_direction
    check_col = col + col_direction
    fields = []
    while board.on_board?(check_row, check_col)
      slot = board.get_tile(check_row, check_col)
      case slot
      when player
        return fields
      when nil
        return nil
      else
        fields << { row: check_row, col: check_col }
      end
      check_row += row_direction
      check_col += col_direction
    end
    nil
  end

  def next_player
    possible_move_for_player?(@player.opponent_tile) ? @player.change_player : @player.tile
  end

  def set_tile(row, col)
    @board.set_tile(row, col, @player.tile)
    switch_opponent_tiles(row, col)
  end

  def switch_opponent_tiles(row, col)
    GameHelper.direction_loop do |row_direction, col_direction|
      adjacent_stones = adjacent_stones(@player.tile, row, col, row_direction, col_direction)
      next if adjacent_stones.nil?
      until adjacent_stones.empty?
        position = adjacent_stones.pop
        @board.change_tile(position[:row], position[:col], @player.tile)
      end
    end
  end

  def possible_move_for_player?(player)
    test_board = @board.clone
    GameHelper.every_slot_on_boad do |row, col|
      return true if is_move_allowed?(player, test_board, row, col)
    end
    false
  end

  def draw
    @board.draw
  end

  def game_over?
    board_full? || !move_possibility?
  end

  def board_full?
    @board.count_all_tiles == Board::SIZE * Board::SIZE
  end

  def move_possibility?
    possible_move_for_player?(@player.tile) || possible_move_for_player?(@player.opponent_tile)
  end

  def get_tile(row, col)
    @board.get_tile(row, col)
  end
end
