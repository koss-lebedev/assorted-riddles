def solution(x)
  n = x
  digits = 6.times.map do
    digit = n % 10
    n /= 10
    digit
  end

  if digits[0..2].inject(:+) == digits[3..-1].inject(:+)
    x
  else
    solution(x + 1)
  end
end



require 'minitest/autorun'

describe 'solution' do
  it 'finds next lucky tickets' do
    assert_equal(123501, solution(123456))
  end
end