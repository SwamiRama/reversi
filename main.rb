require 'green_shoes'
require_relative 'app/models/reversi'
require_relative 'app/views/board_view'
require 'pry'



#def input_handler(input)
#  case input
#  when 'move', 'm'
#    move = gets
#    @reversi.move(move[0].to_i, move[2].to_i)
#  when 'help', 'h'
#    puts 'do help'
#  when 'draw', 'd'
#    @reversi.draw
#  when 'quit', 'exit', 'q'
#    @quit = true
#  else
#    puts 'ERROR: Wrong input'
#  end  
#end
#
#pp 'Welcome to Reversi'
#while(!@reversi.game_over? && !@quit)
#  pp 'current Player = ' + @reversi.current_player
#  input = gets.delete("\n")
#  input_handler(input)
#end
def tile(row, col, left, top, width)
  if @reversi.get_tile(row, col) == 'X'
    fill green
    oval left: left, top: top, width: width
  elsif @reversi.get_tile(row, col) == 'O'
    fill red
    oval left: left, top: top, width: width
  end
end

Shoes.app do
  @reversi = Reversi.new
  @board_view = BoardView.new(@reversi, self)
  @WIDTH = 50 
  @BORDER = 50
  @left = @BORDER 
  @top = @BORDER
  stack do
    0.upto(Board::SIZE - 1) do |row|
      0.upto(Board::SIZE - 1) do |col|
        if row%2 == 0
          if col%2 == 0
          fill black
          rect left: @left, top: @top, width: @WIDTH
          tile(row, col, @left, @top, @WIDTH)
          @left += @WIDTH
          else
          fill white
          rect left: @left, top: @top, width: @WIDTH
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


