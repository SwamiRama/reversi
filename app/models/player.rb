class Player
  @tile

  def initialize(is_first)
    if is_first
      @tile = 'X'
    else
      @tile = 'O'
    end
  end  

  def set_tile(row, col, board)
    board.set_tile(row, col, @tile)
end
