# Monkey patching Integer so I can get rid of utility methods

class Integer
  def sum_digits
    self > 9 ? self - 9 : self
  end
end

# Monkey patching Array so that I can get rid of utility methods

class Array
  def double_every_other
    map.with_index do |string, index|
      num = string.to_i
      index % 2 == 0 ? num : num * 2
    end
  end

  def sum_greater_than_ten
    map do |num|
      num.sum_digits
    end
  end
end

# This CreditCard class is intended to give a simple way to store and validate
# credit card numbers.

class CreditCard
  def initialize(number)
    @number = number
  end

  def valid?
    reversed = @number.split("").reverse
    doubled = reversed.double_every_other
    summed = doubled.sum_greater_than_ten.sum
    summed % 10 == 0 ? true : false
  end
end
