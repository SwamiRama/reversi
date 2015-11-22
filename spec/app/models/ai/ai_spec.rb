require 'spec_helper'

describe 'Ai' do
  let(:reversi) { Reversi.new }

  context 'move' do
    describe 'first move' do
      it 'should move' do
        expect(Ai.best_next_move(reversi, 2)).to eq ({ row: 2, col: 4 })
      end
    end
    describe 'second move' do
      it 'should move' do
        Benchmark.bm do |x|
          60.times do |index|
            x.report("ai move #{index}:") do
              expect(reversi.ai_move).to eq true
            end
            # reversi.draw
          end
        end
        expect(reversi.ai_move).to eq nil
      end
    end
  end
end
