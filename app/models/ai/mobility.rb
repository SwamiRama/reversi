module Mobility
  def self.score_mobility(player_ai, player_opponent, board, reversi)
    @reversi = reversi
    @board = board
    mobility_opponent = score_mobility_for(player_opponent)
    mobility_ai = score_mobility_for(player_ai)
    (64.0 / board.count_all_tiles) * (3.0 * mobility_ai - 4.0 * mobility_opponent)
  end

  def self.score_mobility_for(player)
    mobility_count = 0
    GameHelper.every_slot_on_boad do |row, col|
      mobility_count += 1 if @reversi.is_move_allowed?(player, @board, row, col)
    end
    mobility_count
  end
end
