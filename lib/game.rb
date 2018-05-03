class Game

  attr_reader :players

  def initialize(player_1, player_2)
    @players = [player_1, player_2]
  end

  def attack(type, player)
    player.reduce_hit_points(10)
  end
end
