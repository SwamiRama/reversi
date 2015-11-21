require 'spec_helper'

describe 'Player' do
  let(:player) { Player.new(true) }

  it 'test_initialize' do
    expect(player.tile).to eq 'X'
    player = Player.new(false)
    expect(player.tile).to eq 'O'
  end

  it 'test_get_opponent_tile_for' do
    expect(Player.get_opponent_tile_for('O')).to eq 'X'
    expect(Player.get_opponent_tile_for('X')).to eq 'O'
  end

  it 'test_change_player' do
    expect(player.tile).to eq 'X'
    expect(player.change_player).to eq 'O'
    expect(player.tile).to eq 'O'
  end

  it 'test_all' do
    expect(player.tile).to eq 'X'
    expect(Player.get_opponent_tile_for('X')).to eq 'O'
    expect(player.tile).to eq 'X'
    expect(player.change_player).to eq 'O'
    expect(player.tile).to eq 'O'
    expect(Player.get_opponent_tile_for('O')).to eq 'X'
    expect(player.tile).to eq 'O'
    expect(player.change_player).to eq 'X'
  end
end
