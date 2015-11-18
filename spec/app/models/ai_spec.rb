require 'spec_helper'

describe 'Ai' do
  it 'should move' do
    expect(Ai.best_next_move(Reversi.new, 5)).to eq ({ row: 2, col: 4 } )
  end
end
