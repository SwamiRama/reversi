require_relative '../app/models/player'

describe Player do

  before :each do
    @player = Player.new(true)
  end

  it "test_initialize" do
    expect(@player.tile).to eq 'X'
    @player = Player.new(false)
    expect(@player.tile).to eq 'O'
  end

  it "test_get_opponent_tile" do
    expect(@player.get_opponent_tile).to eq 'O'
    @player = Player.new(false)
    expect(@player.get_opponent_tile).to eq 'X'
  end

  it "test_change_player" do
    expect(@player.tile).to eq 'X'
    expect(@player.change_player).to eq 'O'
    expect(@player.tile).to eq 'O'
  end

  it "test_all" do
    expect(@player.tile).to eq 'X'
    expect(@player.get_opponent_tile).to eq 'O'
    expect(@player.tile).to eq 'X'
    expect(@player.change_player).to eq 'O'
    expect(@player.tile).to eq 'O'
    expect(@player.get_opponent_tile).to eq 'X'
    expect(@player.tile).to eq 'O'
    expect(@player.change_player).to eq 'X'
  end
end
