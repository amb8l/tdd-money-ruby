class Pair
  attr_reader :from, :to

  def initialize(from, to)
    @from = from
    @to = to
  end

  def ==(other)
    @from == other.from && @to == other.to
  end

  def equal?(other)
    self == other
  end

  def hash()
    [@from, @to].hash()
  end

  def eql?(other)
    self.hash() == other.hash()
  end
end
