class Game

  attr_reader :players

  def initialize(player_1, player_2)
    @players = [player_1, player_2]
  end

  def player_1
    @players[0]
  end

  def player_2
    @players[1]
  end

  def attack(player)
    # player = string_check(player)
    player.reduce_hit_points(10)
  end

  private

  # def string_check(player)
  #   if player.is_string? then string_converter(player) else player end
  # end
  #
  # def string_converter(player)
  #   if player == 'player_1'
  #     player_1
  #   elsif player == 'player_2'
  #     player_2
  #   end
  # end

end
