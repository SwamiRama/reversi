module Importance
  BOARD_IMPORTANCE = [
    [9999, 5, 500, 200, 200, 500, 5, 9999],
    [5, 1, 50, 150, 150, 50, 1, 5],
    [500, 50, 250, 100, 100, 250, 50, 500],
    [200, 150, 100, 50, 50, 100, 150, 200],
    [200, 150, 100, 50, 50, 100, 150, 200],
    [500, 50, 250, 100, 100, 250, 50, 500],
    [5, 1, 50, 150, 150, 50, 1, 5],
    [9999, 5, 500, 200, 200, 500, 5, 9999]
  ]
  
  def self.score_importance(player_ai, player_opponent, board)
    @board = board
    score_importance_for(player_ai) - 1.5 * score_importance_for(player_opponent)
  end

  def self.score_importance_for(player)
    importance = 0
    @board.tile_positions(player).each do |position|
      importance += BOARD_IMPORTANCE[position[:row]][position[:col]]
    end
    importance
  end
end
