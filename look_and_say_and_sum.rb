def look_and_say_and_sum(n)
  input = '1'
  (n-1).times do
    input.gsub!(/(.)\1*/) { |match| match.size.to_s + match[0] }
  end
  input.chars.map(&:to_i).inject(:+)
end



require 'minitest/autorun'

describe 'look and say and sum' do
  it 'calculates for 1' do
    assert_equal look_and_say_and_sum(1), 1
  end

  it 'calculates for 3' do
    assert_equal look_and_say_and_sum(3), 3
  end

  it 'calculates for 8' do
    assert_equal look_and_say_and_sum(5), 8
  end

  it 'calculates for 54' do
    assert_equal look_and_say_and_sum(54), 4366359
  end
end