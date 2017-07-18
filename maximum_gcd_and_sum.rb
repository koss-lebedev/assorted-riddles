def solve(a, b)
  a.sort!
  b.sort!

  max_val = [a.last, b.last].max
  f_a = Array.new(max_val + 1, 0)
  f_b = Array.new(max_val + 1, 0)

  a.size.times do |i|
    f_a[a[i]] += 1
    f_b[b[i]] += 1
  end

  i = 1

  res = 0
  while i <= max_val
    max_a, max_b = nil, nil

    j = i
    while j <= max_val
      max_a = j if f_a[j] > 0
      max_b = j if f_b[j] > 0

      j += i
    end

    res = max_a + max_b if max_a && max_b
    i += 1
  end

  res
end

a = [3, 1, 4, 2, 8]
b = [5, 2, 12, 8, 3]



require 'minitest/autorun'

describe 'solution' do
  it 'works with a simple case' do
    a = [3, 1, 4, 2, 8]
    b = [5, 2, 12, 8, 3]
    assert_equal 16, solve(a, b)
  end

end
