class Problem1
  def answer
    sum(3, 1_000) + sum(5, 1_000) - sum(15, 1_000)
  end

  def sum(k , n)
    n = (n - 1) / k
    n  * (n + 1) * k / 2
  end
end

class Problem2
  def initialize(max = 4_000_000)
    @max = max
  end

  def answer
    f_even1, f_even2 = 2, 8
    sum = f_even1
    while f_even2 < @max
      f_even1, f_even2 = f_even2, 4 * f_even2 + f_even1
      sum = sum + f_even1
    end
    return sum
  end
end

class Problem3
  def initialize(num = 600_851_475_143)
    @num = num
  end

  def is_prime?(p)
    div = false
    for i in 2..(Math.sqrt(p))
      div = ((p % i) == 0) || div
    end
    !div
  end

  def answer
    arr = (2..(Math.sqrt(@num))).to_a.reverse
    i = 0
    while ((@num % arr[i]) != 0) || !(is_prime? arr[i])
      i = i + 1
    end
    arr[i]
  end
end

pr1 = Problem1.new()
p pr1.answer

pr2 = Problem2.new()
p pr2.answer

pr3 = Problem3.new()
p pr3.answer


