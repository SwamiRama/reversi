module Potential
  def self.score_potential(player_ai, player_opponent, board, reversi)
    @reversi = reversi
    @board = board
    potential_opponent = score_potential_for(player_opponent)
    potential_machine = score_potential_for(player_ai)
    (64.0 / (2 * board.count_all_tiles)) * (2.5 * potential_machine - 3.0 * potential_opponent)
  end

  def self.score_potential_for(player)
    potential_count = 0
    @board.tile_positions(Player.get_opponent_tile_for(player)).each do |tile|
      potential_count += count_surrounding_empty_slots(tile[:row], tile[:col])
    end
    potential_count
  end

  def self.count_surrounding_empty_slots(row, col)
    empty_slot_count = 0
    GameHelper.direction_loop do |row_direction, col_direction|
      check_row = row + row_direction
      check_col = col + col_direction
      if @board.on_board?(check_row, check_col) && @board.get_tile(check_row, check_col).nil?
        empty_slot_count += 1
      end
    end
    empty_slot_count
  end
end
