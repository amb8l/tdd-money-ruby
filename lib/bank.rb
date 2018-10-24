require 'pair'

class Bank
  def initialize()
    @rates = Hash.new
  end

  def reduce(source, to)
    source.reduce(self, to)
  end

  def add_rate(from, to, rate)
    @rates[Pair.new(from, to)] = rate
  end

  def rate(from, to)
    from == to ? 1 : @rates[Pair.new(from, to)]
  end
end
