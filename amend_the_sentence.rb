def amend_the_sentence(str)
  i = 0
  while char = str[i]
    if char >= ?A && char <= ?Z
      if i == 0
        str[i] = str[i].downcase
      else
        str[i] = ' ' + str[i].downcase
        i += 1
      end
    end

    i += 1
  end

  str
end



require 'minitest/autorun'

describe 'solution' do
  it 'amends the sentence' do
    assert_equal('this is my sentence', amend_the_sentence('ThisIsMySentence'))
  end
end
