module Prob1
  def Prob1.answer
    Prob1.sum(3, 1_000) + Prob1.sum(5, 1_000) - Prob1.sum(15, 1_000)
  end

  def Prob1.sum(k , n)
    n = (n - 1) / k
    n  * (n + 1) * k / 2
  end

  def Prob1.short_solution
    (1..1000).inject(0) { |sum, num| sum + ((num % 3 == 0 || num % 5 == 0) ? num
    : 0) }
  end
end

module Prob2
  MAX = 4_000_000
  
  def Prob2.answer
    f_even1, f_even2 = 2, 8
    sum = f_even1
    while f_even2 < MAX
      f_even1, f_even2 = f_even2, 4 * f_even2 + f_even1
      sum = sum + f_even1
    end
    return sum
  end
end

module Prob3
  NUM = 600_851_475_143

  def Prob3.is_prime?(p)
    div = false
    for i in 2..(Math.sqrt(p))
      div = ((p % i) == 0) || div
    end
    !div
  end

  def Prob3.answer
    arr = (2..(Math.sqrt(NUM))).to_a.reverse
    i = 0
    while ((NUM % arr[i]) != 0) || !(Prob3.is_prime? arr[i])
      i = i + 1
    end
    arr[i]
  end
end

p Prob1.answer
p Prob1.short_solution
p Prob2.answer
p Prob3.answer


