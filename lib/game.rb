class Game
  def attack(type, player)
    player.reduce_hit_points(10)
  end
end
