require 'spec_helper'

describe 'Reversi' do
  let(:reversi) { Reversi.new }

  it 'should initialize' do
    expect(reversi.class).to be Reversi
  end

  it 'should move' do
    expect(reversi.move(0, 0)).to eq false
    expect(reversi.move(4, 2)).to eq true
  end

  it 'should set next_player' do
    expect(reversi.next_player).to eq 'O'
    expect(reversi.next_player).to eq 'X'
    expect(reversi.next_player).to eq 'O'
    expect(reversi.next_player).to eq 'X'
  end
  context 'game_over?' do
    before(:each) do
      GameHelper.every_slot_on_boad do |row, col|
        if row == 0 && col == 0
          reversi.board.set_tile(row, col, nil)
        elsif row == 0 && col == 7
          reversi.board.set_tile(row, col, 'X')
        else
          reversi.board.set_tile(row, col, 'O')
        end
      end
    end
    it 'should be false' do
      expect(reversi.game_over?).to eq false
    end
    it 'should be true' do
      reversi.board.set_tile(0, 0, 'X')
      expect(reversi.game_over?).to eq true
    end
  end
  context 'board_full?' do
    it 'should be true' do
      GameHelper.every_slot_on_boad do |row, col|
        reversi.board.set_tile(row, col, 'O')
      end
      expect(reversi.board_full?).to eq true
    end
  end
  context 'possible_move_for_player?' do
    before(:each) do
      GameHelper.every_slot_on_boad do |row, col|
        if row == 0 && col == 0
          reversi.board.set_tile(row, col, nil)
        elsif row == 0 && col == 7
          reversi.board.set_tile(row, col, 'X')
        else
          reversi.board.set_tile(row, col, 'O')
        end
      end
    end
    it 'should be true' do
      expect(reversi.possible_move_for_player?('X')).to eq true
    end
    it 'should be false' do
      expect(reversi.possible_move_for_player?('O')).to eq false
    end
  end

  it 'play ai' do
    Benchmark.bm do |x|
      10.times do |index|
        x.report("ai move #{index}: ") do
          expect(reversi.ai_move).to eq true
        end
      end
    end
  end
end
