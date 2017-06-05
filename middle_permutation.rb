def middle_permutation(str)
  chars = str.chars.sort

  count = (1..chars.size).reduce(1, :*) / 2

  handler = Proc.new do |permutation|
    count -= 1
    return permutation if count.zero?
  end

  tracker = Hash[chars.map{ |c| [c, 1]}]
  permutate(chars, tracker, Array.new(chars.size), 0, handler)
end

def permutate(chars, tracker, result, level, block)
  if level != result.size
    chars.each do |char|
      next if tracker[char] == 0
      result[level] = char
      tracker[char] -= 1
      permutate(chars, tracker, result, level + 1, block)
      tracker[char] += 1
    end
  else
    block.call(result.join)
  end
end



require 'minitest/autorun'

describe 'middle permutation' do

  it 'calculates for short string' do
    actual = middle_permutation('abc')
    assert_equal actual, 'bac'
  end

  it 'calculates for long string' do
    actual = middle_permutation('abcdefghij')
    assert_equal actual, 'ejihgfdcba'
  end

end