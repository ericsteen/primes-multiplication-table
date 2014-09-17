require 'inline'

class Prime
  def self.first limit=1
    limit = Integer(limit)
    Prime.gather(limit) if limit > 0
  end

  inline do |builder|
    builder.c_singleton '
    int prime(int num) {
      int x;
      for (x = 2; x < (num - 1) ; x++) {
        if (num == 2) {
          return 1;
        }
        if (num % x == 0) {
          return x;
        }
      }
      return 1;
    }'
  end
  
  private

  def self.gather limit
    return 2 if limit == 1

    range = 2...Float::INFINITY
    range.lazy.select { |i| prime i }.first(limit)
  end
end
