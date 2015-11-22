class Player
  attr_reader :current, :one, :two
  def initialize(args)
    @one = args.fetch :player_one
    @two = args.fetch :player_two
    @current = @one
  end

  def opponent_tile
    @current == @one ? @two : @one
  end

  def opponent_tile_for(player)
    player == @one ? @two : @one
  end

  def change_player
    @current == @one ? @current = @two : @current = @one
  end
end
