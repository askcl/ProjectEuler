module Prob6
  def Prob6.answer(lim)
   (lim * (lim + 1) / 2) ** 2 - (1..lim).inject(0) {|sum, el| sum + el ** 2}
  end

  def Prob6.good_solution(lim)
    (lim * (lim + 1) / 2) ** 2 - (2 * lim + 1) * (lim + 1) * lim / 6
  end
end

require 'prime'

module Prob7
  def Prob7.answer(num)
    Prime.take(num)[-1]
  end
  
  def Prob7.is_prime?(p)
    return false if p == 1
    div = false
    i = 2
    n = Math.sqrt(p) + 1
    while i < n && !div
      div = ((p % i) == 0) || div
      i += 1
    end
    !div
  end

#  honest and fair solution
  def Prob7.solution(num)
    count = 1  #  2 -- prime
    p = 1
    while count < num
      p += 2  # there is no prime even numbers except 2
      count += 1 if Prob7.is_prime?(p) 
    end
    return p
  end
end

module Prob8
  NUM = 
    "73167176531330624919225119674426574742355349194934
     96983520312774506326239578318016984801869478851843
     85861560789112949495459501737958331952853208805511
     12540698747158523863050715693290963295227443043557
     66896648950445244523161731856403098711121722383113
     62229893423380308135336276614282806444486645238749
     30358907296290491560440772390713810515859307960866
     70172427121883998797908792274921901699720888093776
     65727333001053367881220235421809751254540594752243
     52584907711670556013604839586446706324415722155397
     53697817977846174064955149290862569321978468622482
     83972241375657056057490261407972968652414535100474
     82166370484403199890008895243450658541227588666881
     16427171479924442928230863465674813919123162824586
     17866458359124566529476545682848912883142607690042
     24219022671055626321111109370544217506941658960408
     07198403850962455444362981230987879927244284909188
     84580156166097919133875499200524063689912560717606
     05886116467109405077541002256983155200055935729725
     71636269561882670428252483600823257530420752963450".delete!("\n").split(//).map(&:to_i)
  
  def Prob8.NUM
    NUM
  end

  def Prob8.answer(size)
    max = 1
    ind = 0
    while ind <= size do
      ind += 1 while NUM[ind] == 0
      prod = NUM[ind] 
      for i in (ind + 1)..(ind + 12) 
        if NUM[i] == 0
          ind = i + 12
          prod = 1 
          break
        end
        prod = prod * NUM[i]
      end
      ind = ind + 1
      max = prod if prod > max
    end
    max
  end
end

module Prob9
  def Prob9.answer(sum)
    a = 0
    b = 0
    c = 0
    flag = false
    for a in 1..(sum / 3) 
      for b in a..(sum / 2) 
        c = sum - a - b
        if (a * a + b * b == c * c)
          flag = true
          break
        end 
      end
      break if flag
    end
    a * b * c
  end
end

module Prob10
  def Prob10.answer(n)
    Prime.take_while { |p| p < n }.inject(:+)
  end
end

p Prob6.answer(100)
p Prob6.good_solution(100)
p Prob7.answer(10_001)
p Prob7.solution(10_001)
p Prob8.answer(1000)
p Prob9.answer(1000)
p Prob10.answer(2_000_000)
