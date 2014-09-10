require_relative "prime"
require_relative "multiplication_table"

class PrimesMultiplicationTable
  attr_reader :size, :data

  DEFAULT_TABLE_SIZE = 10

  def initialize size=DEFAULT_TABLE_SIZE
    @size = size || DEFAULT_TABLE_SIZE
    @data = table_data
  end

  def render
    MultiplicationTable.draw data
  end

  private

  def table_header
    @header_data ||= [1] + Array(Prime.first(size))
  end

  def table_data
    cache = {}
    table_header.map do |x|
      table_header.map do |y|
        if result = cache["#{x},#{y}"] or result = cache["#{y},#{x}"]
          result
        else
          result = x*y
          cache["#{x},#{y}"] = result
          cache["#{y},#{x}"] = result
        end
      end
    end
  end
end
