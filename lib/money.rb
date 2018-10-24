require 'sum'

class Money
  attr_reader :amount, :currency

  def self.dollar(amount = 0)
    Money.new(amount, "USD")
  end

  def self.franc(amount = 0)
    Money.new(amount, "CHF")
  end

  def times(multiplier)
    Money.new(@amount * multiplier, @currency)
  end

  def plus(addend)
    Sum.new(self, addend)
  end

  def reduce(bank, to)
    rate = bank.rate(@currency, to)
    Money.new(@amount / rate, to)
  end

  def ==(other)
    @amount == other.amount &&
    @currency == other.currency
  end

  def equal?(other)
    self == other
  end

  private

  def initialize(amount, currency)
    @amount = amount
    @currency = currency
  end
end
