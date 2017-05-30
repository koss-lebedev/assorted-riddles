def merge_sorted_lists(left, right)
  result = []
  left_index, right_index = 0, 0

  loop do
    a = left[left_index]
    b = right[right_index]

    if a.nil? && b.nil?
      break
    elsif a.nil?
      result << b
      right_index += 1
    elsif b.nil?
      result << a
      left_index += 1
    else
      if a < b
        result << a
        left_index += 1
      else
        result << b
        right_index += 1
      end
    end
  end

  result
end



require 'minitest/autorun'

describe 'merger function' do

  it 'merges empty arrays' do
    actual = merge_sorted_lists [], []
    assert_equal [], actual
  end

  it 'merges with empty array' do
    actual = merge_sorted_lists [], [1, 2, 3]
    assert_equal [1, 2, 3], actual
  end

  it 'merges arrays of different length' do
    actual = merge_sorted_lists([1, 5], [2, 3, 4, 5, 6])
    assert_equal [1, 2, 3, 4, 5, 5, 6], actual
  end

end