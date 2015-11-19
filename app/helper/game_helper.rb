module GameHelper
  def GameHelper.direction_loop
    -1.upto(1) do |row_direction|
      -1.upto(1) do |col_direction|
        next unless row_direction != 0 || col_direction != 0
        yield row_direction, col_direction
      end
    end
  end

  def GameHelper.every_slot_on_boad
    0.upto(Board::SIZE) do |row|
      0.upto(Board::SIZE) do |col|
        yield row, col
      end
    end
  end
end
