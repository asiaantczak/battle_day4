class Player
  attr_reader :name, :hit_points

  STARTING_HIT_POINTS = 100

  def initialize(name, hit_points = STARTING_HIT_POINTS)
    @name = name
    @hit_points = hit_points
  end

  def set_name(name)
    @name = name
  end

  def reduce_hit_points(points)
    @hit_points -= points
  end


end
