require 'spec_helper'

describe 'Board' do
  before :each do
    @board = Board.new({ player_one: 'X', player_two: 'O' })
  end

  context 'set_tile_allowd?' do
    it 'should be false' do
      expect(@board.set_tile_allowed?(-1, -1)).to eq false
      expect(@board.set_tile_allowed?(9999, 9999)).to eq false
      expect(@board.set_tile_allowed?(-1, 9999)).to eq false
      expect(@board.set_tile_allowed?(9999, -2)).to eq false
    end

    it 'should be true' do
      expect(@board.set_tile_allowed?(0, 0)).to eq true
      expect(@board.set_tile_allowed?(5, 5)).to eq true
      expect(@board.set_tile_allowed?(7, 7)).to eq true
      expect(@board.set_tile_allowed?(0, 2)).to eq true
    end

    it 'should be false' do
      expect(@board.set_tile_allowed?(4, 4)).to eq false
      expect(@board.set_tile_allowed?(4, 3)).to eq false
      expect(@board.set_tile_allowed?(3, 4)).to eq false
      expect(@board.set_tile_allowed?(3, 3)).to eq false
    end
  end

  context 'change_tile_allowed?' do
    it 'should change tile from player' do
      expect(@board.change_tile_allowed?(4, 4, 'O')).to eq true
      expect(@board.change_tile_allowed?(3, 3, 'O')).to eq true
      expect(@board.change_tile_allowed?(4, 3, 'X')).to eq true
      expect(@board.change_tile_allowed?(3, 4, 'X')).to eq true

      expect(@board.change_tile_allowed?(4, 4, 'X')).to eq false
      expect(@board.change_tile_allowed?(3, 3, 'X')).to eq false
      expect(@board.change_tile_allowed?(4, 3, 'O')).to eq false
      expect(@board.change_tile_allowed?(3, 4, 'O')).to eq false
    end
  end

  context 'count_tiles_for_player' do
    it 'should count 2' do
      expect(@board.count_tiles_for_player('O')).to eq 2
      expect(@board.count_tiles_for_player('X')).to eq 2
    end
  end

  context 'count_all_tiles' do
    it 'should count 4' do
      expect(@board.count_all_tiles).to eq 4
    end
  end

  context 'get_tile' do
    it 'should get X' do
      expect(@board.get_tile(4, 4)).to eq 'X'
      expect(@board.get_tile(3, 3)).to eq 'X'
    end

    it 'should get O' do
      expect(@board.get_tile(3, 4)).to eq 'O'
      expect(@board.get_tile(4, 3)).to eq 'O'
    end
  end

  context 'on_board' do
    it 'should be true' do
      expect(@board.on_board?(0, 0)).to eq true
      expect(@board.on_board?(7, 7)).to eq true
      expect(@board.on_board?(0, 7)).to eq true
      expect(@board.on_board?(7, 0)).to eq true
    end

    it 'should be false' do
      expect(@board.on_board?(8, 8)).to eq false
      expect(@board.on_board?(12, 2)).to eq false
      expect(@board.on_board?(2, 12)).to eq false
      expect(@board.on_board?(8, 0)).to eq false
    end
  end

  context 'tile_positions' do
    it 'expect an array' do
      expect(@board.tile_positions('X').class).to be Array
    end
    it 'get possitions' do
      expect(@board.tile_positions('X')).to eq [{row: 3, col: 3}, {row: 4, col: 4}]
      expect(@board.tile_positions('O')).to eq [{row: 3, col: 4}, {row: 4, col: 3}]
    end
  end
end
