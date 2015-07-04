class Player
  attr_reader :tile
  def initialize(is_first)
    if is_first
      @tile = 'X'
    else
      @tile = 'O'
    end
  end

  def get_opponent_tile
    @tile == 'O' ? 'X' : 'O'
  end

  def self.get_opponent_tile_for(player)
    player == 'O' ? 'X' : 'O'
  end

  def change_player
    @tile == 'O' ? @tile = 'X' : @tile = 'O'
  end
end
