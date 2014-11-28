class Player
  attr_reader :tile

  def initialize(is_first)
    if is_first
      @tile = 'X'
    else
      @tile = 'O'
    end
  end  
end
