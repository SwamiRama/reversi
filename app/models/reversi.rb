require_relative 'board'

class Reversi
  @firstTurn
  @nextTurn
  @board
  @level
  @current_player
  @BOARD_IMPORTANCE = [
    [9999, 5, 500, 200, 200, 500, 5, 9999],
    [5, 1, 50, 150, 150, 50, 1, 5],
    [500, 50, 250, 100, 100, 250, 50, 500],
    [200, 150, 100, 50, 50, 100, 150, 200],
    [200, 150, 100, 50, 50, 100, 150, 200],
    [500, 50, 250, 100, 100, 250, 50, 500],
    [5, 1, 50, 150, 150, 50, 1, 5],
    [9999, 5, 500, 200, 200, 500, 5, 9999] 
  ]
  
  
  def initialize(player_first, level)
    if player_first == nil
      raise ArgumentError, "player_first is nil"
    end
    @current_player = 'X'
    @board = Board.new(@current_player, 'O')
  end

  def move(row, col)
    if game_over?
      puts 'game over!'
    elsif is_move_allowed(row, col)
      set_tile(row, col)
      return true
    else
      return false
    end
  end

  def next_player
    if @current_player == 'O'
      @current_player = 'X'
    else
      @current_player = 'O'
    end
  end

  private
  def game_over?
    return false
  end

  def set_tile(row, col)
    @board.set_tile(row, col, @current_player)
    -1.upto(1) { |row_direction|
      -1.upto(1) { |col_direction|
        if row_direction != 0 || col_direction != 0
          adjacent_stones = get_adjacent_stones(row, col, row_direction, col_direction)
          puts "start set_tile loop"
          while adjacent_stones.empty?            
            position = adjacent_stones.pop
            @board.set_tile(position[:row], position[:col], @current_player)
          end
        end
      }
    }
  end

  def is_move_allowed(row, col)
    if @board.set_tile_allowed?(row, col, @current_player)
      -1.upto(1) { |row_direction|
        -1.upto(1) { |col_direction|
          if row_direction != 0 || col_direction != 0
            adjacent_stones = get_adjacent_stones(row, col, row_direction, col_direction)
            if !adjacent_stones.nil? && !adjacent_stones.empty?
              return true
            end
          end
        }
      }
    end
    return false
  end

  def get_adjacent_stones(row, col, row_direction, col_direction)
    if row_direction == 0 && col_direction == 0
      raise "there is no direction"
    end

    check_row = row + row_direction
    check_col = col + col_direction

    fields = []
    puts "start get_adjacent_stones loop"
    while @board.on_board?(check_row, check_col)
      slot = @board.get_tile(check_row, check_col)
      if @current_player == slot
        return fields
      elsif slot.nil?
        return nil
      else
        slot << {:row => check_row, :col => check_col}
      end
      check_row = check_row + row_direction
      check_col = check_col * col_direction
    end
    return nil    
  end
end
