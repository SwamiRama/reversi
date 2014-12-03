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

  def initialize(token)
    @player_ai = token
  end

  def move(level, board, reversi)
    @level = level
    @board = board
    @reversi = reversi
  end

  private
  def get_best_next_move_score(lvl)
    best_move = nil
    bestScore = 0.0
    0.upto(@board.SIZE) do row
      0.upto(@board.SIZE) do col
        if @reversi.is_move_allowed(row, col)
          checking_board = @reversi.clone
          checking_board.set_slot(row, col)

          check_score = checking_board.get_score_total

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

  def score_importance(player)
    importance = 0
    @tile_position.each do |tile|
      if tile[:tile] == player
        importance += BOARD_IMPORTANCE[tile[:row]][tile[:col]]
      end
    end
    return importance
  end

  def score_mobility

  end

  def score_mobility(player)

  end

  def score_potential

  end

  def score_potential(player)

  end
end
