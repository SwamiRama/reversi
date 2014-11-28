class Tile
  attr_reader :player
  attr_reader :col
  attr_reader :row
  def initialize(player, col, row)
    @col = col
    @row = row
    @player = player
  end
end
