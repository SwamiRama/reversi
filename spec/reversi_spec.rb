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

  it 'should play without AI' do
    expect(@reversi.current_player).to eq 'X'
    expect(@reversi.move(0, 0)).to be false
    expect(@reversi.current_player).to eq 'X'
    expect(@reversi.move(4, 2)).to be true
    expect(@reversi.current_player).to eq 'O'
    expect(@reversi.move(5, 3)).to be false
    expect(@reversi.current_player).to eq 'O'
    expect(@reversi.move(5, 4)).to be true
    expect(@reversi.current_player).to eq 'X'
    expect(@reversi.move(5, 4)).to be false
    expect(@reversi.move(4, 5)).to be true
  end
  it 'should play with AI' do
    expect(@reversi.ai_move).to eq true
    @reversi.draw
    expect(@reversi.ai_move).to eq true
    @reversi.draw
    expect(@reversi.ai_move).to eq true
    @reversi.draw
    expect(@reversi.ai_move).to eq true
    @reversi.draw
  end
end
