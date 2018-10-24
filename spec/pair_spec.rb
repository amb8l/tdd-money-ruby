require 'rspec'
require 'pair'

describe Pair do
  before(:each) do
    @pair = Pair.new("from", "to")
  end

  it "is equal" do
    expect(@pair).to eq @pair
    expect(@pair).to eq Pair.new("from", "to")
    expect(@pair).to equal @pair
    expect(@pair).to equal Pair.new("from", "to")
    expect(@pair).to eql @pair
    expect(@pair).to eql Pair.new("from", "to")
  end

  it "is not equal" do
    expect(@pair).not_to eq Pair.new("where", "there")
    expect(@pair).not_to equal Pair.new("where", "there")
    expect(@pair).not_to eql Pair.new("where", "there")
  end
end
