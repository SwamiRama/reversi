require 'green_shoes'
require_relative 'app/models/reversi'
require 'pry'

Shoes.app do
  @WIDTH = 50 
  @BORDER = 50
  @left = @BORDER 
  @top = @BORDER
  stack do
    1.upto(8) do |row|
      1.upto(4) do |col|
        if row%2 == 0
          fill black
          rect left: @left, top: @top, width: @WIDTH
          @left += @WIDTH
          fill white
          rect left: @left, top: @top, width: @WIDTH
          @left += @WIDTH
        else
          fill white
          rect left: @left, top: @top, width: @WIDTH
          @left += @WIDTH
          fill black
          rect left: @left, top: @top, width: @WIDTH
          @left += @WIDTH
        end
      end
      @left = @BORDER
      @top += @WIDTH
    end
  end
end
Shoes.app do
  fill green
  rect left: 10, top: 10, width: 20
end
