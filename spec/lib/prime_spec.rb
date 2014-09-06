require_relative "../../lib/prime.rb"

describe Prime do
  it "returns prime numbers up to a given n using trial division" do
    expect(Prime.first).to eq(2)
    expect(Prime.first(5)).to eq([2, 3, 5, 7, 11])
    expect(Prime.first(-100)).to be_nil
  end

  it "checks whether given number is a prime" do
    expect(Prime.prime?(1)).to be_false
    expect(Prime.prime?(2)).to be_true
    expect(Prime.prime?(101)).to be_true
    expect(Prime.prime?(-101)).to be_false
  end
end
