require_relative '../app/models/board'

describe Board do
  before :each do
    player = Player.new(true)
    @board = Board.new(player.tile, player.get_opponent_tile)
  end

  it 'should be false set_tile_allowed out of board' do
    expect(@board.set_tile_allowed?(-1, -1)).to be false
    expect(@board.set_tile_allowed?(9999, 9999)).to be false
    expect(@board.set_tile_allowed?(-1, 9999)).to be false
    expect(@board.set_tile_allowed?(9999, -2)).to be false
  end

  it 'should be false set_tile_allowed out of board' do
    expect(@board.set_tile_allowed?(0, 0)).to be true
    expect(@board.set_tile_allowed?(5, 5)).to be true
    expect(@board.set_tile_allowed?(7, 7)).to be true
    expect(@board.set_tile_allowed?(0, 2)).to be true
  end

  it 'should be true set_tile_allowed out of board' do
    expect(@board.set_tile_allowed?(4, 4)).to be false
    expect(@board.set_tile_allowed?(4, 3)).to be false
    expect(@board.set_tile_allowed?(3, 4)).to be false
    expect(@board.set_tile_allowed?(3, 3)).to be false
  end

  it 'should change tile from player' do
    expect(@board.change_tile(4, 4, 'O')).to be true
    expect(@board.change_tile(3, 3, 'O')).to be true
    expect(@board.change_tile(4, 3, 'X')).to be true
    expect(@board.change_tile(3, 4, 'X')).to be true

    player = Player.new(true)
    @board = Board.new(player.tile, player.get_opponent_tile)

    expect(@board.change_tile(4, 4, 'X')).to be false
    expect(@board.change_tile(3, 3, 'X')).to be false
    expect(@board.change_tile(4, 3, 'O')).to be false
    expect(@board.change_tile(3, 4, 'O')).to be false

    player = Player.new(true)
    @board = Board.new(player.tile, player.get_opponent_tile)

    expect(@board.change_tile(4, 4, 'O')).to be true
    expect(@board.change_tile(3, 3, 'O')).to be true
    expect(@board.change_tile(4, 3, 'X')).to be true
    expect(@board.change_tile(3, 4, 'X')).to be true
    expect(@board.change_tile(4, 4, 'X')).to be true
    expect(@board.change_tile(3, 3, 'X')).to be true
    expect(@board.change_tile(4, 3, 'O')).to be true
    expect(@board.change_tile(3, 4, 'O')).to be true
  end
end
