require_relative 'app/models/reversi'
require 'pry'



def input_handler(input)
  case input
  when 'move', 'm'
    puts 'row:'
    row = gets
    puts 'col'
    col = gets
    if @reversi.move(row.to_i, col.to_i)
      @reversi.ai_move
    end
  when 'help', 'h'
    puts 'do help'
  when 'draw', 'd'
    @reversi.draw
  when 'quit', 'exit', 'q'
    @quit = true
  else
    puts 'ERROR: Wrong input'
  end
end

pp 'Welcome to Reversi'
@reversi = Reversi.new
while(!@reversi.game_over? && !@quit)
  pp 'current Player = ' + @reversi.current_player
  pp 'm or move'
  pp 'd or draw'
  pp 'h or help'
  input = gets.delete("\n")
  input_handler(input)
end


##############################################

#Shoes.app do
#  @reversi = Reversi.new
#  @board_view = BoardView.new(@reversi, self)
#  @board_view.draw
#end
