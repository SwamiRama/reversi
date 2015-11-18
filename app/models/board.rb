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

  def set_tile(row, col, _current_player)
    @board[row][col] = current_user if set_tile_allowed?(row, col)
  end

  def set_tile_allowed?(row, col)
    on_board?(row, col) && @board[row][col].nil?
  end

  def change_tile(row, col, current_player)
    if change_tile_allowed?(row, col, current_player)
      @board[row][col] = current_player
    end
  end

  def change_tile_allowed?(row, col, current_player)
    !(@board[row][col].nil? || @board[row][col] == current_player)
  end

  def on_board?(row, col)
    row.between?(0, SIZE) && col.between?(0, SIZE)
  end

  def get_tile_positions_entry(row, col)
    @board.each do |tile|
      return tile if tile[:row] == row && tile[:col] == col
    end
  end

  def count_tiles_for_player(player)
    @board.map { |row| row.count(player) }.inject(:+)
  end

  def count_all_tiles
    SIZE * SIZE - @board.map { |row| row.count(nil) }.inject(:+)
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
