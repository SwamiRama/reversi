require 'spec_helper'

describe 'Reversi' do
  before :each do
    @reversi = Reversi.new
  end

  it 'should initialize' do
    @reversi = Reversi.new
    expect(@reversi.class).to be Reversi
  end

  it 'should move' do
    expect(@reversi.move(0, 0)).to eq false
    expect(@reversi.move(4, 2)).to eq true
  end

  it 'should set next_player' do
    expect(@reversi.next_player).to eq 'O'
    expect(@reversi.next_player).to eq 'X'
    expect(@reversi.next_player).to eq 'O'
    expect(@reversi.next_player).to eq 'X'
  end

  it 'play ai' do
    expect(@reversi.ai_move).to eq true
    @reversi.draw
    expect(@reversi.ai_move).to eq true
    @reversi.draw
    expect(@reversi.ai_move).to eq true
    @reversi.draw
    expect(@reversi.ai_move).to eq true
    @reversi.draw
    expect(@reversi.ai_move).to eq true
    @reversi.draw
    expect(@reversi.ai_move).to eq true
    @reversi.draw
    expect(@reversi.ai_move).to eq true
    @reversi.draw
    expect(@reversi.ai_move).to eq true
    @reversi.draw
    expect(@reversi.ai_move).to eq true
    @reversi.draw
    expect(@reversi.ai_move).to eq true
    @reversi.draw
    expect(@reversi.ai_move).to eq true
    @reversi.draw
    expect(@reversi.ai_move).to eq true
    @reversi.draw
    expect(@reversi.ai_move).to eq true
    @reversi.draw
    expect(@reversi.ai_move).to eq true
    @reversi.draw
    expect(@reversi.ai_move).to eq true
    @reversi.draw
    expect(@reversi.ai_move).to eq true
    @reversi.draw
    expect(@reversi.ai_move).to eq true
    @reversi.draw
    expect(@reversi.ai_move).to eq true
    @reversi.draw
    expect(@reversi.ai_move).to eq true
    @reversi.draw
    expect(@reversi.ai_move).to eq true
    @reversi.draw
    expect(@reversi.ai_move).to eq true
    @reversi.draw
    expect(@reversi.ai_move).to eq true
    @reversi.draw
    expect(@reversi.ai_move).to eq true
    @reversi.draw
    expect(@reversi.ai_move).to eq true
    @reversi.draw
    expect(@reversi.ai_move).to eq true
    @reversi.draw
    expect(@reversi.ai_move).to eq true
    @reversi.draw
    expect(@reversi.ai_move).to eq true
    @reversi.draw
    expect(@reversi.ai_move).to eq true
    @reversi.draw
    expect(@reversi.ai_move).to eq true
    @reversi.draw
    expect(@reversi.ai_move).to eq true
    @reversi.draw
    expect(@reversi.ai_move).to eq true
    @reversi.draw
    expect(@reversi.ai_move).to eq true
    @reversi.draw
    expect(@reversi.ai_move).to eq true
    @reversi.draw
    expect(@reversi.ai_move).to eq true
    @reversi.draw
    expect(@reversi.ai_move).to eq true
    @reversi.draw
    expect(@reversi.ai_move).to eq true
    @reversi.draw
    expect(@reversi.ai_move).to eq true
    @reversi.draw
    expect(@reversi.ai_move).to eq true
    @reversi.draw
    expect(@reversi.ai_move).to eq true
    @reversi.draw
    expect(@reversi.ai_move).to eq true
    @reversi.draw
    expect(@reversi.ai_move).to eq true
    @reversi.draw
    expect(@reversi.ai_move).to eq true
    @reversi.draw
    expect(@reversi.ai_move).to eq true
    @reversi.draw
    expect(@reversi.ai_move).to eq true
    @reversi.draw
    expect(@reversi.ai_move).to eq true
    @reversi.draw
    expect(@reversi.ai_move).to eq true
    @reversi.draw
    expect(@reversi.ai_move).to eq true
    @reversi.draw
    expect(@reversi.ai_move).to eq true
    @reversi.draw
    expect(@reversi.ai_move).to eq true
    @reversi.draw
    expect(@reversi.ai_move).to eq true
    @reversi.draw
    expect(@reversi.ai_move).to eq true
    @reversi.draw
    expect(@reversi.ai_move).to eq true
    @reversi.draw
    expect(@reversi.ai_move).to eq true
    @reversi.draw
    expect(@reversi.ai_move).to eq true
    @reversi.draw
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
