require 'spec_helper'

describe 'Potential' do
  let(:reversi) { Reversi.new }
  let(:board) { reversi.board }

  context 'score_potential' do
    it 'should be -40' do
      expect(Potential.score_potential('X', 'O', board, reversi)).to eq -40
      expect(Potential.score_potential('O', 'X', board, reversi)).to eq -40
    end
  end
  context 'score_potential_for' do
    it 'should be 10' do
      expect(Potential.score_potential_for('O')).to eq 10
      expect(Potential.score_potential_for('X')).to eq 10
    end
  end

  context 'count_surrounding_empty_slots' do
    it 'should be 8' do
      expect(Potential.count_surrounding_empty_slots(1, 1)).to eq 8
    end
    it 'should be 6' do
      expect(Potential.count_surrounding_empty_slots(2, 4)).to eq 6
    end
  end
end
