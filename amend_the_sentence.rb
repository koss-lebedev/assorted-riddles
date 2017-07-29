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

def amend_the_sentence_regex(str)
  str.gsub(/[A-Z]{1}/) { |match| ' ' + match[0].downcase }.strip
end



require 'minitest/autorun'

describe 'solution' do
  it 'amends the sentence' do
    assert_equal('this is my sentence', amend_the_sentence('ThisIsMySentence'))
  end

  it 'amends the sentence using RegEx' do
    assert_equal('this is my sentence', amend_the_sentence_regex('ThisIsMySentence'))
  end
end
