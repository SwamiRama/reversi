require 'spec_helper'

describe 'Importance' do
  let(:reversi) { Reversi.new }
  let(:board) { reversi.board }

  context 'score_importance' do
    it 'should be -50' do
      expect(Importance.score_importance('X', 'O', board)).to eq -50
      expect(Importance.score_importance('O', 'X', board)).to eq -50
    end
  end
  context 'score_importance_for' do
    it 'should be 100' do
      expect(Importance.score_importance_for('X')).to eq 100
      expect(Importance.score_importance_for('O')).to eq 100
    end
  end
end
