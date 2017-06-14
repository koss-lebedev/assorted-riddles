def pascals_triangle(n)
  result = []
  (1..n).each do |depth|
    result << []
    depth.times do |i|
      if i == 0 || i == depth-1
        result[depth-1][i] = 1
      else
        result[depth-1][i] = result[depth-2][i-1] + result[depth-2][i]
      end
    end
  end

  result.flatten
end



require 'minitest/autorun'

describe 'pascals_triangle' do
  it 'calculates five levels' do
    assert_equal [1, 1, 1, 1, 2, 1, 1, 3, 3, 1, 1, 4, 6, 4, 1], pascals_triangle(5)
  end
end
