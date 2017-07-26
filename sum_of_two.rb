def sum_of_two(a, b, v)
  a.sort! { |x, y| y <=> x }
  b.sort! { |x, y| y <=> x }

  i = 0
  while i < a.size
    j = 0
    while j < b.size && a[i] + b[j] >= v
      return true if a[i] + b[j] == v
      j += 1
    end
    i += 1
  end

  false
end



require 'minitest/autorun'

describe 'solution' do
  it 'finds the sum' do
    assert_equal true, sum_of_two([1, 2, 3], [10, 20, 30, 40], 42)
  end
end
