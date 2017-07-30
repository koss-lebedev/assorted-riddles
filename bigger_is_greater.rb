def solution(word)
  i = word.size - 2
  x = nil
  while (word[i] >= word[i+1]) && (i >= 0)
    if word[i+1] > word[0] && (x == nil || word[i+1] < word[x])
      x = i+1
    end
    i -= 1
  end

  return nil if i < 0

  x = i+1 unless x

  word[i], word[x] = word[x], word[i]
  (word[0..i].chars + word[i+1..word.size].chars.sort).join
end



require 'minitest/autorun'

describe 'solution' do
  it 'passes case 1' do
    assert_equal('ba', solution('ab'))
  end

  it 'passes case 2' do
    assert_nil(solution('bb'))
  end

  it 'passes case 3' do
    assert_equal('hegf', solution('hefg'))
  end

  it 'passes case 4' do
    assert_equal('dhkc', solution('dhck'))
  end

  it 'passes case 5' do
    assert_equal('hcdk', solution('dkhc'))
  end
end
