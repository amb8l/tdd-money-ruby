require 'rspec'
require 'bank'
require 'money'

describe Money do
  before(:each) do
    @five_bucks = Money.dollar(5)
    @ten_francs = Money.franc(10)
    @bank = Bank.new()
  end

  context "newly initialised" do
    it "has zero amount" do
      dollar = Money.dollar()
      expect(dollar.amount).to eq 0
    end

    it "has the assigned amount" do
      expect(@five_bucks.amount).to eq 5
    end

    it "has a currency type" do
      expect(Money.dollar(1).currency).to eq "USD"
      expect(Money.franc(1).currency).to eq "CHF"
    end
  end

  context "in the same currency" do
    it "is equal when amount is equal" do
      expect(@five_bucks).to equal Money.dollar(5)
    end

    it "is not equal when amount is different" do
      expect(@five_bucks).not_to equal Money.dollar(6)
    end

    it "can be multiplied" do
      expect(@five_bucks.times(2)).to equal Money.dollar(10)
      expect(@five_bucks.times(3)).to equal Money.dollar(15)
    end

    it "can be added" do
      sum = @five_bucks.plus(@five_bucks)
      reduced = @bank.reduce(sum, "USD")
      expect(reduced).to equal Money.dollar(10)
    end

    it "returns the sum" do
      sum = @five_bucks.plus(@five_bucks)
      expect(sum.augend).to equal @five_bucks
      expect(sum.addend).to equal @five_bucks
    end
  end

  context "in different currencies" do
    it "is not equal" do
      expect(@five_bucks).not_to equal Money.franc(5)
    end

    it "can be multiplied" do
      @bank.add_rate("CHF", "USD", 2)
      result = @bank.reduce(@five_bucks.plus(@ten_francs), "USD")
      expect(result).to eq Money.dollar(10)
    end

    it "can be added" do
      @bank.add_rate("CHF", "USD", 2)
      sum = Sum.new(@five_bucks, @ten_francs).plus(@five_bucks)
      result = @bank.reduce(sum, "USD")
      expect(result).to eq Money.dollar(15)
    end

    it "can be added and multiplied" do
      @bank.add_rate("CHF", "USD", 2)
      sum = Sum.new(@five_bucks, @ten_francs).times(2)
      result = @bank.reduce(sum, "USD")
      expect(result).to eq Money.dollar(20)
    end
  end
end
