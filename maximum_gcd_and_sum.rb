def gcd(a, b)
  while b != 0
    c = a % b
    a, b = b, c
  end
  a
end

def solve(a, b)
  n = a.size

  a.sort! { |i, j| j <=> i }
  b.sort! { |i, j| j <=> i }

  max, res, i = 0, 0, 0

  while a[i] > max && i < n
    j = 0
    while b[j] > max && j < n
      d = a[i] > b[j] ? gcd(a[i], b[j]) : gcd(b[j], a[i])
      if d > max
        max = d
        res = a[i] + b[j]
      end

      j += 1
    end
    i += 1
  end

  res
end



require 'minitest/autorun'

describe 'solution' do
  it 'works with a simple case' do
    a = [3, 1, 4, 2, 8]
    b = [5, 2, 12, 8, 3]
    assert_equal 16, solve(a, b)
  end

end

