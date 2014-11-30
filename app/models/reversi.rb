require_relative 'board'

class Reversi
  @firstTurn
  @nextTurn
  @board
  @level
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
  
  
  def initialize(firstTurn, level)
    if firstTurn == nil
      raise ArgumentError, "firstTurn is nil"
    end
    @board = Board.new('X', 'O')
    @current_player = 'X'
  end

  def move(row, col)
    if @board.set_tile(row, col, @current_player)
      -1.upto(1) { |row_direction|  end
        -1.upto(1) { |col_direction|
          puts row_direction
          puts col_direction
        }
      }
    end
  end

  private
  def legal_move?(row, col)
    
  end
end
