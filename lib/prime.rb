class Prime
  def self.first limit=1
    limit = Integer(limit)
    Prime.gather(limit) if limit > 0
  end

  # A simple but slow method of verifying the primality of a given number n is known as trial division. 
  # It consists of testing whether n is a multiple of any integer between 2 and \sqrt{n}. 
  # Algorithms much more efficient than trial division have been devised to test the primality of large numbers.
  # Particularly fast methods are available for numbers of special forms, such as Mersenne numbers.
  def self.prime? number
    number = Integer(number)
    return false if number < 2

    trial_divisions = (2..Math.sqrt(number).to_i)
    trial_divisions.none? { |d| number % d == 0 }
  end

  private

  def self.gather limit
    return 2 if limit == 1

    range = 2...Float::INFINITY
    range.lazy.select { |i| prime? i }.first(limit)
  end
end
