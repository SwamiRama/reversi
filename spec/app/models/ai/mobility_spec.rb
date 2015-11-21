require 'spec_helper'

describe 'Mobility' do
  let(:reversi) { Reversi.new }
  let(:board) { reversi.board }

  context 'score_mobility' do
    it 'should be -64' do
      expect(Mobility.score_mobility('X', 'O', board, reversi)).to eq -64
      expect(Mobility.score_mobility('O', 'X', board, reversi)).to eq -64
    end
  end
  context 'score_mobility_for' do
    it 'should be 4' do
      expect(Mobility.score_mobility_for('O')).to eq 4
      expect(Mobility.score_mobility_for('X')).to eq 4
    end
  end  
end
