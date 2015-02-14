class Ai
  @BOARD_IMPORTANCE = [
    [9999, 5, 500, 200, 200, 500, 5, 9999],
    [5, 1, 50, 150, 150, 50, 1, 5],
    [500, 50, 250, 100, 100, 250, 50, 500],
    [200, 150, 100, 50, 50, 100, 150, 200],
    [200, 150, 100, 50, 50, 100, 150, 200],
    [500, 50, 250, 100, 100, 250, 50, 500],
    [5, 1, 50, 150, 150, 50, 1, 5],
    [9999, 5, 500, 200, 200, 500, 5, 9999] 
  ]

  def initialize(tile)
    @player_ai = tile
  end

  def move(level, reversi)
    @level = level
    @board = reversi.board
    @reversi = reversi
    require 'pry'; binding.pry
    return get_best_next_move
  end

  private
  def get_best_next_move_score(lvl)
    best_move = nil
    bestScore = 0.0
    0.upto(Board::SIZE) do |row|
      0.upto(Board::SIZE) do |col|
        if @reversi.is_move_allowed?(@player_ai, @board, row, col)
          checking_board = @reversi.clone
          checking_board.set_tile(row, col)
          @board = checking_board.board

          check_score = score_total

          if lvl > 0 && !checking_board.gameOver
            check_score += checking_board.get_best_next_move_score(lvl - 1)
          end

          if bestScore.nil? || is_new_extremum_depending_on_player_turn(bestScore, check_score)
            bestScore = check_score
            best_move << {:row => row, :col => col}
          end
        end
      end
    end

    @best_next_move = best_move

    if bestScore.nil?
      raise "move error"
    end
    return bestScore
  end

  def get_best_next_move
    get_best_next_move_score(@level - 1)
    return @best_next_move
  end

  def is_new_extremum_depending_on_player_turn(reference_value, score)
    if @next_turn == @next_opponent
      return reference_value > score;
    else
      return reference_value < score;
    end
  end

  def score_total
    return score_importance + score_mobility + score_potential
  end

  def score_importance
    return score_importance(@player_ai) - 1.5 * score_importance(@player_human)
  end

  def score_importance(player = nil)
    importance = 0
    @board.tile_positions.each do |tile|
      if tile[:tile] == player
        importance += BOARD_IMPORTANCE[tile[:row]][tile[:col]]
      end
    end
    return importance
  end

  def score_mobility
    mobility_human = score_mobility(@player_human)
    mobility_machine = score_mobility(@player_ai)
    return (64.0 / count_tiles) * (3.0 * mobility_machine - 4.0 * mobility_human)
  end

  def score_mobility(player = nil)
    mobility_count = 0
    0.upto(Board::SIZE) do |row|
      0.upto(Board::SIZE) do |col|
        if @reversi.is_move_allowed?(player, @board, row, col)
          mobility_count += 1
        end
      end
    end
  end

  def score_potential
    potential_human = score_potential(@player_human)
    potential_machine = score_potential(@player_ai)
    return (64.0 / (2 * count_tiles)) * (2.5 * potential_machine - 3.0 * potential_human)
  end

  def score_potential(player = nil)
    potential_count = 0
    opponent = @player.get_opponent_tile
    @tile_position.each do |tile|
      if tile == opponent
        potential_count += count_surrounding_empty_slot(row, col)
      end
    end
  end

  def count_surrounding_empty_slot(row, col)
    empty_slot_count = 0
    -1.upto(1) do |row_direction|
      -1.upto(1) do |col_direction|
        if row_direction != 0 || col_direction != 0
          check_row = row + row_direction
          check_col = col + col_direction
          if @board.on_board? && @board.get_tile(check_row, check_col).nil?
            empty_slot_count += 1
          end
        end
      end
    end
  end
end
