require_relative 'tile'
class Board
  SIZE = 8
  attr_reader :tile_positions
  def initialize(stone_player_one, stone_player_two)
    @tile_positions = [] 
    @tile_positions << Tile.new(stone_player_one, SIZE / 2 + 1, SIZE / 2 + 1)
    @tile_positions << Tile.new(stone_player_one, SIZE / 2 - 1, SIZE / 2 - 1)
    @tile_positions << Tile.new(stone_player_two, SIZE / 2 - 1, SIZE / 2 + 1)
    @tile_positions << Tile.new(stone_player_two, SIZE / 2 + 1, SIZE / 2 - 1)
  end

  def draw
    
  end
end
