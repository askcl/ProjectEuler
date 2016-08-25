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

module Prob4
  def Prob4.slow_solution
   res = 0
   (100..999).to_a.reverse.each do |i|
      (100..i).to_a.reverse.each do |j|
        num = i * j
        if num == num.to_s.reverse.to_i && res < num
          res = num
          break
        end
      end
    end
    res
  end

  def Prob4.fast_solution
    res = 0
    (100..999).to_a.reverse.each do |i|
      if i % 11 == 0
        j = 999
        d = 1
      else
        j = 990
        d = 11
      end
      while j >= i
        num = i * j
        res = num if num > res && num == num.to_s.reverse.to_i
        j = j - d
      end
    end
    res
  end
end

require 'prime'

module Prob5
  def Prob5.answer
    primes = Prime.take(10).select { |p| p < 20 }  
    counts = Array.new(primes.size, 1)
    (1..20).each do |i|
      factors = Array.new(20, 0)
      k = 0
      while i > 1
        if (i % primes[k]) == 0
          factors[primes[k]] = factors[primes[k]] + 1
          i = i / primes[k]
          k = 0
        else
          k = k + 1
        end
      end
      primes.each_with_index do |item, index| 
        counts[index] = factors[item] if counts[index] < factors[item]
      end
    end
    res = 1
#    p primes
#    p counts
    primes.each_with_index do |item, index|
      res = res * (item ** counts[index])
    end
    res
  end
end


p Prob1.answer
p Prob1.short_solution
p Prob2.answer
p Prob3.answer
p Prob4.slow_solution
p Prob4.fast_solution
p Prob5.answer
