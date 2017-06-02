def extract_ranges(array)
  ranges = []
  current = [array.first]

  handle_range = ->(range) do
    range.size > 2 ? ranges << "#{range.first}-#{range.last}" : ranges += range
  end

  array.each_cons(2) do |a , b|
    if b - a == 1
      current << b
    else
      handle_range.(current)
      current = [b]
    end
  end

  handle_range.(current)

  ranges.join(',')
end




require 'minitest/autorun'

describe 'extract range function' do
  it 'extracts ranges' do
    actual = extract_ranges [-6, -3, -2, -1, 0, 1, 3, 4, 5, 7, 8, 9, 10, 11, 14, 15, 17, 18, 19, 20]
    puts actual
    assert_equal '-6,-3-1,3-5,7-11,14,15,17-20', actual
  end
end