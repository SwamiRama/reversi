require_relative 'board'
require_relative 'player'
require_relative 'ai'

class Reversi
  attr_reader :current_player, :board
  def initialize
    @player = Player.new(true)
    @current_player = @player.tile
    @board = Board.new(@player.tile, @player.get_opponent_tile)
    @gameOver = false
    @level = 5
  end

  def move(row, col)
    if game_over?
      puts 'game over!'
    elsif is_move_allowed?(@player, @board, row, col)
      set_tile(row, col)
      next_player
      return true
    else
      return false
    end
  end

  def ai_move
    ai = Ai.new(@player.get_opponent_tile)
    ai.move(@level, self)
    move(ai.board.tile_positions.last[:row],ai.board.tile_positions.last[:col])
  end

  def next_player
    move_possible_for_player?(@player.get_opponent_tile) ? @current_player = @player.change_player : @current_player
  end

  def draw
    @board.draw
  end

  def game_over?
    @board.count_all_tiles == Board::SIZE * Board::SIZE ? true : false
  end

  def set_tile(row, col)
    @board.set_tile(row, col, @player.tile)
    -1.upto(1) do |row_direction|
      -1.upto(1) do |col_direction|
        if row_direction != 0 || col_direction != 0
          adjacent_stones = []
          adjacent_stones = get_adjacent_stones(@player, @board, row, col, row_direction, col_direction)
          if !adjacent_stones.nil?
            while !adjacent_stones.empty?
              position = adjacent_stones.pop
              @board.change_tile(position[:row], position[:col], @player.tile)
            end
          end
        end
      end
    end
  end

  def is_move_allowed?(player, board, row, col)
    good_move = false
    if board.set_tile_allowed?(row, col)
      -1.upto(1) do |row_direction|
        -1.upto(1) do |col_direction|
          if row_direction != 0 || col_direction != 0
            adjacent_stones = get_adjacent_stones(player, board, row, col, row_direction, col_direction)
            if !adjacent_stones.nil?
             if !adjacent_stones.empty?
               return good_move = true
             end
            end
          end
        end
      end
      good_move
    else
      return false
    end
  end

  def move_possible_for_player?(player)
    test_board = @board.clone
    0.upto(Board::SIZE) do |row|
      0.upto(Board::SIZE) do |col|
        if test_board.set_tile_allowed?(row,col)
          is_move_allowed?(player, test_board, row, col)
        end
      end
    end
  end

  def get_adjacent_stones(player, board, row, col, row_direction, col_direction)
    if row_direction == 0 && col_direction == 0
      raise "there is no direction"
    end

    check_row = row + row_direction
    check_col = col + col_direction

    fields = []
    while board.on_board?(check_row, check_col)
      #puts "start get_adjacent_stones loop on row = " + check_row.to_s + " and col = " + check_col.to_s
      slot = board.get_tile(check_row, check_col)
      if @player.tile == slot
        return fields
      elsif slot.nil?
        return nil
      else
        fields << {:row => check_row, :col => check_col}
      end
      check_row = check_row + row_direction
      check_col = check_col + col_direction
    end
    return nil
  end

  def get_tile(row, col)
    @board.get_tile(row, col)
  end
end
