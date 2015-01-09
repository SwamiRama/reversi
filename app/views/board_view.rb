require 'green_shoes'
class BoardView 
  def initialize(board, app)
    @board = board
    @app = app
  end

  def new_board(board)
    @board = board
  end

  def draw_tile(left, top, width, row, col)
    player(row, col)
    @app.oval left: left, top: top, width: width
  end

  def player(row, col)
    if @board.get_tile(row, col) == 'X'
      @app.fill @app.green
    elsif @board.get_tile(row, col) == 'O'
      @app.fill @app.red
    else
      nil
    end
  end
end
