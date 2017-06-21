def minimum_chocolate_moves(n, arr)
  incorrect = arr.each_with_index.select do |c, i|
    (i.odd? && c.even?) || (i.even? && c.odd?)
  end.map(&:first)

  if incorrect.size.zero?
    0
  elsif incorrect.size.odd? || arr.inject(:+) < n / 2 + (n - n / 2) * 2
    -1
  else
    incorrect.size / 2 + [incorrect.count { |v| v == 1 } - incorrect.size / 2, 0].max
  end
end



require 'minitest/autorun'

describe 'minimum_chocolate_moves' do
  it 'works with sample cases' do
    assert_equal minimum_chocolate_moves(6, [6, 8, 3, 1, 1, 4]), 2
    assert_equal minimum_chocolate_moves(5, [3, 1, 1, 1, 1]), -1
    assert_equal minimum_chocolate_moves(3, [14, 3, 10]), 0
  end
end
