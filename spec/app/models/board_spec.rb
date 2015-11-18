require 'spec_helper'

describe 'Board' do
  before :each do
    @board = Board.new({ player_one: 'X', player_two: 'O' })
  end

  context 'set_tile_allowd?' do
    it 'should be false' do
      expect(@board.set_tile_allowed?(-1, -1)).to be false
      expect(@board.set_tile_allowed?(9999, 9999)).to be false
      expect(@board.set_tile_allowed?(-1, 9999)).to be false
      expect(@board.set_tile_allowed?(9999, -2)).to be false
    end

    it 'should be true' do
      expect(@board.set_tile_allowed?(0, 0)).to be true
      expect(@board.set_tile_allowed?(5, 5)).to be true
      expect(@board.set_tile_allowed?(7, 7)).to be true
      expect(@board.set_tile_allowed?(0, 2)).to be true
    end

    it 'should be false' do
      expect(@board.set_tile_allowed?(4, 4)).to be false
      expect(@board.set_tile_allowed?(4, 3)).to be false
      expect(@board.set_tile_allowed?(3, 4)).to be false
      expect(@board.set_tile_allowed?(3, 3)).to be false
    end
  end

  context 'change_tile_allowed?' do
    it 'should change tile from player' do
      expect(@board.change_tile_allowed?(4, 4, 'O')).to be true
      expect(@board.change_tile_allowed?(3, 3, 'O')).to be true
      expect(@board.change_tile_allowed?(4, 3, 'X')).to be true
      expect(@board.change_tile_allowed?(3, 4, 'X')).to be true

      expect(@board.change_tile_allowed?(4, 4, 'X')).to be false
      expect(@board.change_tile_allowed?(3, 3, 'X')).to be false
      expect(@board.change_tile_allowed?(4, 3, 'O')).to be false
      expect(@board.change_tile_allowed?(3, 4, 'O')).to be false
    end
  end

  context 'count_tiles_for_player' do
    it 'should count 2' do
      expect(@board.count_tiles_for_player('O')).to be 2
      expect(@board.count_tiles_for_player('X')).to be 2
    end
  end

  context 'count_all_tiles' do
    it 'should count 4' do
      expect(@board.count_all_tiles).to be 4
    end
  end
end
