require 'minitest/autorun'
require_relative '../../app/models/reversi'

class TestReversi < Minitest::Test
  def setup
    @reversi = Reversi.new('X', 1)
  end

  def test_next_player
    assert_equal "O", @reversi.next_player
  end
end
