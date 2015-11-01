require 'pry'

class Board
  SIZE = 8
  attr_reader :tile_positions
  def initialize(stone_player_one, stone_player_two)
    @tile_positions = []
    @tile_positions << { tile: stone_player_one, row: SIZE / 2, col: SIZE / 2 }
    @tile_positions << { tile: stone_player_one, row: SIZE / 2 - 1, col: SIZE / 2 - 1 }
    @tile_positions << { tile: stone_player_two, row: SIZE / 2, col: SIZE / 2 - 1 }
    @tile_positions << { tile: stone_player_two, row: SIZE / 2 - 1, col: SIZE / 2 }
    puts @tile_positions if $DEBUG
  end

  def set_tile_allowed?(row, col)
    if on_board?(row, col)
      if get_tile(row, col).nil?
        return true
      else
        return false
      end
    else
      return false
    end
  end

  def change_tile(row, col, current_player)
    if get_tile(row, col) != current_player
      @tile_positions.each do |tile|
        if tile[:row] == row && tile[:col] == col
          tile[:tile] = current_player
          return true
        end
      end
    end
    false
  end

  def set_tile(row, col, current_player)
    if set_tile_allowed?(row, col)
      @tile_positions << { tile: current_player, row: row, col: col }
    end
  end

  def on_board?(row, col)
    if row.between?(0, SIZE) && col.between?(0, SIZE)
      return true
    else
      return false
    end
  end

  def get_tile_positions_entry(row, col)
    @tile_positions.each do |tile|
      return tile if tile[:row] == row && tile[:col] == col
    end
    nil
  end

  def get_tile(row, col)
    @tile_positions.each do |tile|
      return tile[:tile] if tile[:row] == row && tile[:col] == col
    end
    nil
  end

  def draw
    puts ' |0|1|2|3|4|5|6|7|'
    0.upto(SIZE - 1) do |row|
      board = "#{row}|"
      0.upto(SIZE - 1) do |col|
        if $DEBUG
          puts 'col = ' + col.to_s + ', row = ' + row.to_s
          puts @tile_positions
        end
        stone = ''
        @tile_positions.each do |tile|
          if tile[:row] == row && tile[:col] == col
            stone = tile[:tile]
            break
          else
            stone = '?'
          end
        end
        board << stone + '|' unless stone.nil?
      end
      puts board
    end
  end

  def count_tiles_for_player(player)
    count = 0
    @tile_positions.each do |tile|
      count += 1 if tile[:tile] == player
    end
    count
  end

  def count_all_tiles
    @tile_positions.count
  end
end
