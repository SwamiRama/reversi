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
    if $DEBUG
      puts @tile_positions
    end
  end

  def set_tile_allowed?(row, col)
    if on_board?(row, col)
      @tile_positions.each do |tile|
        if tile[:row] == row && tile[:col] == col
          puts "move not allowed, there is already a tile!"
          return false
        end
      end
    else
      return false
    end
    return true
  end

  def change_tile(row, col, current_player)
    if get_tile(row, col) != current_player
      @tile_positions.each do |tile|
        if tile[:row] == row && tile[:col] == col
          tile[:tile] = current_player
        end
      end
    end
  end

  def set_tile(row, col, current_player)
    if set_tile_allowed?(row, col)
      @tile_positions << {:tile => current_player, :row => row, :col => col}
    end
  end


  def on_board?(row, col)
    if row < SIZE && col < SIZE && row >= 0 && col >= 0
      return true
    else
      return false
    end
  end

  def get_tile(row, col)
    @tile_positions.each do |tile|
      if tile[:row] == row && tile[:col] == col
        return tile[:tile]
      end
    end
    return nil
  end


  def draw
    0.upto(SIZE - 1) { |row|
      board = "|"
      0.upto(SIZE - 1) { |col|
        if $DEBUG
          puts 'col = ' + col.to_s + ', row = ' + row.to_s
          puts @tile_positions
        end
        stone = ""
        @tile_positions.each do |tile|
          if tile[:row] == row && tile[:col] == col
            stone = tile[:tile]
            break
          else
            stone = "?"
          end
        end
        if !stone.nil?
          board << stone + "|"
        end
      }
      puts board
    }
  end
end
