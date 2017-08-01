def solution(word)
  i = word.size - 2
  while (word[i] >= word[i+1]) && (i >= 0)
    i -= 1
  end

  if i < 0
    nil
  else
    j = word.size - 1
    while j > i
      if word[j] > word[i]
        word[j], word[i] = word[i], word[j]
        break
      end
      j -= 1
    end


    (word[0..i].chars + word[i+1..word.size].chars.sort).join
  end
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
