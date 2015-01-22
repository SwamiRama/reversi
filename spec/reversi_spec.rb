require 'minitest/autorun'
require_relative '../app/models/reversi'
class TestReversi < Minitest::Test
  def setup
    @reversi = Reversi.new
  end

  def test_move
    assert_equal false, @reversi.move(0,0)
    assert_equal true, @reversi.move(4,2)
  end
end
