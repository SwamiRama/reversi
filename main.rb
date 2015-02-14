require 'green_shoes'
require_relative 'app/models/reversi'
require_relative 'app/views/board_view'
require 'pry'



def input_handler(input)
  case input
  when 'move', 'm'
    move = gets
    if @reversi.move(move[0].to_i, move[2].to_i)
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
  pp 'm move'
  pp 'd draw'
  input = gets.delete("\n")
  input_handler(input)
end


##############################################

#Shoes.app do
#  @reversi = Reversi.new
#  @board_view = BoardView.new(@reversi, self)
#  @board_view.draw
#end
