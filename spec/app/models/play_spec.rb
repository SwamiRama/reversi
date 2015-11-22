require 'spec_helper'

describe 'Player' do
  let(:player) { Player.new({ player_one: 'X', player_two: 'O' }) }

  it 'test_initialize' do
    expect(player.current).to eq player.one
    player = Player.new({ player_one: 'O', player_two: 'X' })
    expect(player.current).to eq player.one
  end
  context 'opponent_tile_for' do
    it 'should be X' do
      expect(player.opponent_tile_for(player.one)).to eq 'O'
    end
    it 'should be O' do
      expect(player.opponent_tile_for('O')).to eq 'X'
    end
  end
  context 'opponent_tile' do
    it 'should be X' do
      expect(player.opponent_tile).to eq player.two
    end
  end
  context 'change_player' do
    it 'should change_player' do
      expect(player.current).to eq 'X'
      expect(player.change_player).to eq 'O'
      expect(player.current).to eq 'O'
    end
  end

  it 'test_all' do
    expect(player.current).to eq player.one
    expect(player.opponent_tile_for(player.one)).to eq player.two
    expect(player.current).to eq player.one
    expect(player.change_player).to eq 'O'
    expect(player.current).to eq 'O'
    expect(player.opponent_tile_for('O')).to eq player.one
    expect(player.current).to eq 'O'
    expect(player.change_player).to eq player.one
  end
end
