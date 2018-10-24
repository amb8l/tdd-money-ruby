class Point
  attr_reader :x, :y, :z
  def initialize(x, y, z)
    @x, @y, @z = x, y, z
  end
  def ==(other)
    x == other.x && y == other.y && z == other.z
  end
  def eql?(other)
    self == other
  end
  def hash
    [x, y, z].hash
  end
end
