class Player
  attr_reader :name, :hit_points

  STARTING_HIT_POINTS = 100

  def initialize(name, hit_points = STARTING_HIT_POINTS)
    @name = name
    @hit_points = hit_points
  end
end
