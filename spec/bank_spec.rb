require 'rspec'
require 'bank'
require 'sum'
require 'money'

describe Bank do
  before(:each) do
    @bank = Bank.new()
  end

  context "with money in same currency" do
    it "reduces the sum" do
      sum = Sum.new(Money.dollar(3), Money.dollar(4))
      result = @bank.reduce(sum, "USD")
      expect(result).to equal Money.dollar(7)
    end

    it "has an identity rate" do
      expect(@bank.rate("USD", "USD")).to eq 1
    end

    it "reduces money" do
      result = @bank.reduce(Money.dollar(1), "USD")
      expect(result).to equal Money.dollar(1)
    end
  end

  context "with money in different currencies" do
    it "can be reduced" do
      @bank.add_rate("CHF", "USD", 2)
      result = @bank.reduce(Money.franc(2), "USD")
      expect(result).to equal Money.dollar(1)
    end
  end
end
