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
    self.tile == 'O' ? 'X' : 'O'
  end

  def change_player
    if self.tile == 'O'
      @tile = 'X'
    else
      @tile = 'O'
    end
  end
end
