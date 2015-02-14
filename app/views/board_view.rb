require 'green_shoes'
class BoardView < Shoes
  @WIDTH = 50 
  @BORDER = 50
  @left = @BORDER 
  @top = @BORDER

  def initialize(reversi, app)
    @reversi = reversi
    @app = app
  end

  def new_board(reversi)
    @reversi = reversi
  end
  
  
  def draw
    @app.stack do
      0.upto(Board::SIZE - 1) do |row|
        0.upto(Board::SIZE - 1) do |col|
          if row%2 == 0
            if col%2 == 0
              @app.fill @app.black
              rect left: @left, top: @top, width: @WIDTH
              tile(row, col, @left, @top, @WIDTH)
              @left += @WIDTH
            else
              @app.fill @app.fwhite
              @app.rect left: @left, top: @top, width: @WIDTH
              tile(row, col, @left, @top, @WIDTH)
              @left += @WIDTH
            end
          else
            if col%2 == 0
              fill white
              rect left: @left, top: @top, width: @WIDTH
              tile(row, col, @left, @top, @WIDTH              )
              @left += @WIDTH
            else
              fill black
              rect left: @left, top: @top, width: @WIDTH
              tile(row, col, @left, @top, @WIDTH)
              @left += @WIDTH
            end
            #@board_view.draw_tile(left, top, width, row, col)
          end
        end
        @left = @BORDER
        @top += @WIDTH
      end
    end
  end

  private
  def tile(row, col, left, top, width)
    if @reversi.get_tile(row, col) == 'X'
      fill green
      oval left: left, top: top, width: width
    elsif @reversi.get_tile(row, col) == 'O'
      fill red
      oval left: left, top: top, width: width
    end
  end
  def player(row, col)
    if @reversi.get_tile(row, col) == 'X'
      @app.fill @app.green
    elsif @reversi.get_tile(row, col) == 'O'
      @app.fill @app.red
    else
      nil
    end
  end
end
