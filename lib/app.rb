require "optparse"
require_relative "primes_multiplication_table"

options = {}

OptionParser.new do |opts|
  opts.banner = "Usage: #$0 -s size"

  opts.on "-s", "--size NUMBER", "Size of multiplication table (defaults to 10)" do |s|
    options[:size] = s
  end

  opts.on "-h", "--help", "Shows usage" do
    warn opts
    exit
  end
end.parse!

PrimesMultiplicationTable.new(options[:size]).render
