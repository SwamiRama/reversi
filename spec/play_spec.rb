require 'minitest/autorun'
require_relative '../app/models/player'

class TestPlayer < Minitest::Test
  def setup
    @player = Player.new(true)
  end

  def test_initialize
    assert_equal 'X', @player.tile
    @player = Player.new(false)
    assert_equal 'O', @player.tile
  end

  def test_get_opponent_tile
    assert_equal 'O', @player.get_opponent_tile
  end

  def test_change_player
    assert_equal 'O', @player.change_player
    assert_equal 'O', @player.tile
  end

  def test_all
    assert_equal 'X', @player.tile
    assert_equal 'O', @player.get_opponent_tile
    assert_equal 'X', @player.tile
    assert_equal 'O', @player.change_player
    assert_equal 'O', @player.tile
    assert_equal 'X', @player.get_opponent_tile
    assert_equal 'O', @player.tile
    assert_equal 'X', @player.change_player
  end
end
