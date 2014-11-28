class Reversi
  @firstTurn
  @nextTurn
  @gameField
  @level
  @FIELD_IMPORTANCE = [
    [9999, 5, 500, 200, 200, 500, 5, 9999],
    [5, 1, 50, 150, 150, 50, 1, 5],
    [500, 50, 250, 100, 100, 250, 50, 500],
    [200, 150, 100, 50, 50, 100, 150, 200],
    [200, 150, 100, 50, 50, 100, 150, 200],
    [500, 50, 250, 100, 100, 250, 50, 500],
    [5, 1, 50, 150, 150, 50, 1, 5],
    [9999, 5, 500, 200, 200, 500, 5, 9999] 
  ]
  
  
  def initialize(firstTurn, level)
    if firstTurn == nil
      raise ArgumentError, "firstTurn is nil"
    end

    @firstTurn = firstTurn
    @nextTurn = firstTurn
    
  end
end

