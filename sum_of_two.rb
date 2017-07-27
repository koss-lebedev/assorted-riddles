def sum_of_two(a, b, sum)
  hash = a.each_with_object({}) { |v, h| h[v] = true }

  b.each do |i|
    return true if hash[sum-i]
  end

  false
end



require 'minitest/autorun'

describe 'solution' do
  it 'finds the sum' do
    assert_equal true, sum_of_two([1, 2, 3], [10, 20, 30, 40], 42)
  end
end
