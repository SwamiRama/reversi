require 'green_shoes'
require_relative 'app/models/reversi'
require 'pry'


@reversi = Reversi.new

def input_handler(input)
  case input
  when 'move', 'm'
    move = gets
    @reversi.move(move[0].to_i, move[2].to_i)
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
while(!@reversi.game_over? && !@quit)
  pp 'current Player = ' + @reversi.current_player
  input = gets.delete("\n")
  input_handler(input)
end

#Shoes.app do
#  @WIDTH = 50 
#  @BORDER = 50
#  @left = @BORDER 
#  @top = @BORDER
#  stack do
#    1.upto(8) do |row|
#      1.upto(4) do |col|
#        if row%2 == 0
#          fill black
#          rect left: @left, top: @top, width: @WIDTH
#          @left += @WIDTH
#          fill white
#          rect left: @left, top: @top, width: @WIDTH
#          @left += @WIDTH
#        else
#          fill white
#          rect left: @left, top: @top, width: @WIDTH
#          @left += @WIDTH
#          fill black
#          rect left: @left, top: @top, width: @WIDTH
#          @left += @WIDTH
#        end
#      end
#      @left = @BORDER
#      @top += @WIDTH
#    end
#  end
#end
#Shoes.app do
#  fill green
#  rect left: 10, top: 10, width: 20
#end
