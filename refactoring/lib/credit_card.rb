# This CreditCard class is intended to give a simple way to store and validate
# credit card numbers.

class CreditCard
  def initialize(number)
    @number = number
  end

  def valid?
    array = @number.split("")
    reversed = array.reverse
    doubled = double(reversed)
    summed = sum_greater_than_ten(doubled)
    check(summed.sum)
  end

  private
  def double(nums)
    nums.map.with_index do |string, index|
      num = string.to_i
      index % 2 == 0 ? num : num * 2
    end
  end

  def sum_greater_than_ten(array)
    array.map do |num|
      num > 9 ? num - 9 : num
    end
  end

  def check(total)
    total % 10 == 0 ? true : false
  end
end
