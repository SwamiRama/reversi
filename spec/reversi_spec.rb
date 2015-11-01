require_relative '../app/models/reversi'

describe Reversi do
  before :each do
    @reversi = Reversi.new
  end

  it 'should initialize' do
    @reversi = Reversi.new
  end

  it 'should move' do
    expect(@reversi.move(0, 0)).to be false
    expect(@reversi.move(4, 2)).to be true
  end

  it 'should draw' do
  end

  it 'should set next_player' do
    expect(@reversi.next_player).to eq 'O'
  end
end
