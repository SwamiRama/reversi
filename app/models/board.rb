require 'pry'

class Board
  SIZE = 8
  attr_reader :tile_positions
  def initialize(stone_player_one, stone_player_two)
    @tile_positions = [] 
    @tile_positions << {:tile => stone_player_one, :row => SIZE / 2, :col => SIZE / 2}
    @tile_positions << {:tile => stone_player_one, :row => SIZE / 2 - 1, :col => SIZE / 2 - 1}
    @tile_positions << {:tile => stone_player_two, :row => SIZE / 2, :col => SIZE / 2 - 1}
    @tile_positions << {:tile => stone_player_two, :row => SIZE / 2 - 1, :col => SIZE / 2}
  end

  def set_tile(row, col, new_tile)
    if row < SIZE && col < SIZE && row >= 0 && col >= 0
      good_move = true 
      @tile_positions.each do |tile|
        if tile[:row] == row && tile[:col] == col
          puts "move not allowed, there is already a tile!"
          good_move = false
        end
      end
      if good_move
        @tile_positions << {:tile => new_tile, :row => row, :col => col}
      end
    else
      puts "move out of size!"
    end
  end

  def draw
    0.upto(SIZE - 1) { |row|
      board = "|"
      0.upto(SIZE - 1) { |col|
        stone = ""
        @tile_positions.each do |tile|
          if tile[:row] == row && tile[:col] == col
            stone = tile[:tile]
            break
          else
            stone = "?"
          end
        end
        board << stone + "|"
      }
      puts board
    }
  end
end
