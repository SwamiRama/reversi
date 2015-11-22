class Board
  SIZE = 8
  attr_reader :board
  def initialize(args)
    @board = Array.new(SIZE) { Array.new(SIZE) }
    @board[SIZE / 2][SIZE / 2] = args.fetch(:player_one)
    @board[SIZE / 2 - 1][SIZE / 2 - 1] = args.fetch(:player_one)
    @board[SIZE / 2][SIZE / 2 - 1] = args.fetch(:player_two)
    @board[SIZE / 2 - 1][SIZE / 2] = args.fetch(:player_two)
  end

  def set_tile(row, col, current_player)
    @board[row][col] = current_player if set_tile_allowed?(row, col)
  end

  def set_tile_allowed?(row, col)
    on_board?(row, col) && @board[row][col].nil?
  end

  def change_tile(row, col, current_player)
    @board[row][col] = current_player if change_tile_allowed?(row, col, current_player)
  end

  def change_tile_allowed?(row, col, current_player)
    !(@board[row][col].nil? || @board[row][col] == current_player)
  end

  def on_board?(row, col)
    row.between?(0, SIZE - 1) && col.between?(0, SIZE - 1)
  end

  def get_tile(row, col)
    @board[row][col]
  end

  def count_tiles_for_player(player)
    @board.map { |row| row.count(player) }.inject(:+)
  end

  def count_all_tiles
    SIZE * SIZE - @board.map { |row| row.count(nil) }.inject(:+)
  end

  def tile_positions(player)
    a = []
    @board.each_with_index do |row, row_index|
      row.each_with_index do |col, col_index|
        a << { row: row_index, col: col_index } if col == player
      end
    end
    a
  end

  def draw
    puts ' |0|1|2|3|4|5|6|7|'
    @board.each_with_index do |row, index|
      draw_board = "#{index}|"
      row.each do |col|
        if col.nil?
          draw_board << '?'
        else
          draw_board << col
        end
        draw_board << '|'
      end
      puts draw_board
    end
  end
end
