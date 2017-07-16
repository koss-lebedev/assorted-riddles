def solution(n, s)
  whole, remainder = n.divmod(s.size)
  count, extra = 0, 0
  s.chars.each_with_index do |char, index|
    if char == ?a
      count += 1
      extra += 1 if index < remainder
    end
  end

  count * whole + extra
end



require 'minitest/autorun'

describe 'repeated string' do

  it 'should count for N not proportional to S' do
    assert_equal(7, solution(10, 'aba'))
  end

  it 'should count for N not proportional to S' do
    assert_equal(1000000000000, solution(1000000000000, 'a'))
  end

end
