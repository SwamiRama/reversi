require 'spec_helper'

describe 'Ai' do
  before(:all) do
    @reversi = Reversi.new
  end
  context 'move' do
    describe 'first move' do
      it 'should move' do
        expect(Ai.best_next_move(@reversi, 5)).to eq ({ row: 2, col: 4 })
      end
    end
    describe 'second move' do
      it 'should move' do
        expect(@reversi.ai_move).to eq true
        expect(@reversi.ai_move).to eq true
        expect(@reversi.ai_move).to eq true
        expect(@reversi.ai_move).to eq true
        expect(@reversi.ai_move).to eq true
        expect(@reversi.ai_move).to eq true
        expect(@reversi.ai_move).to eq true
        expect(@reversi.ai_move).to eq true
        expect(@reversi.ai_move).to eq true
        expect(@reversi.ai_move).to eq true
        expect(@reversi.ai_move).to eq true
        expect(@reversi.ai_move).to eq true
        expect(@reversi.ai_move).to eq true
        expect(@reversi.ai_move).to eq true
        expect(@reversi.ai_move).to eq true
        expect(@reversi.ai_move).to eq true
        expect(@reversi.ai_move).to eq true
        expect(@reversi.ai_move).to eq true
        expect(@reversi.ai_move).to eq true
        expect(@reversi.ai_move).to eq true
        expect(@reversi.ai_move).to eq true
        expect(@reversi.ai_move).to eq true
        expect(@reversi.ai_move).to eq true
        expect(@reversi.ai_move).to eq true
        expect(@reversi.ai_move).to eq true
        expect(@reversi.ai_move).to eq true
        expect(@reversi.ai_move).to eq true
        expect(@reversi.ai_move).to eq true
        expect(@reversi.ai_move).to eq true
        expect(@reversi.ai_move).to eq true
        expect(@reversi.ai_move).to eq true
        expect(@reversi.ai_move).to eq true
        expect(@reversi.ai_move).to eq true
        expect(@reversi.ai_move).to eq true
        expect(@reversi.ai_move).to eq true
        expect(@reversi.ai_move).to eq true
        expect(@reversi.ai_move).to eq true
        expect(@reversi.ai_move).to eq true
        expect(@reversi.ai_move).to eq true
        expect(@reversi.ai_move).to eq true
        expect(@reversi.ai_move).to eq true
        expect(@reversi.ai_move).to eq true
        expect(@reversi.ai_move).to eq true
        expect(@reversi.ai_move).to eq true
        expect(@reversi.ai_move).to eq true
        expect(@reversi.ai_move).to eq true
        expect(@reversi.ai_move).to eq true
        expect(@reversi.ai_move).to eq true
        expect(@reversi.ai_move).to eq true
        expect(@reversi.ai_move).to eq true
        expect(@reversi.ai_move).to eq true
        expect(@reversi.ai_move).to eq true
        expect(Ai.best_next_move(@reversi, 1)).to eq ({ row: 7, col: 1 })
        expect(@reversi.ai_move).to eq true
        expect(Ai.best_next_move(@reversi, 1)).not_to eq nil
      end
    end
  end
end
