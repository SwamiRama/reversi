require_relative 'app/models/reversi'
require 'pry'
require 'green_shoes'

TITLE = 'Reversi'
WIDTH = 600
HEIGHT = 600
TILE_SIZE = 30

Shoes.app title: TITLE, width: WIDTH, height: HEIGHT do
  def tile(x, y, color)
    fill color
    oval(x, y, TILE_SIZE / 2)
  end

  def player_tile(x, y, stone)
    case stone
    when @reversi.player.one
      tile x, y, black
    when @reversi.player.two
      tile x, y, white
    end
  end

  @reversi = Reversi.new

  animate = animate 1 do
    player_tile WIDTH - TILE_SIZE, 0, @reversi.player.current

    @reversi.board.board.each_with_index do |array, index_x|
      array.each_with_index do |stone, index_y|
        draw_x = index_x * TILE_SIZE
        draw_y = index_y * TILE_SIZE

        fill green
        rect(draw_x, draw_y, TILE_SIZE).click { @reversi.move index_x, index_y }
        player_tile(draw_x, draw_y, stone)
      end
    end
    @reversi.ai_move
    if @reversi.game_over?
      alert 'Game Over'
      animate.stop
    end
  end
end
