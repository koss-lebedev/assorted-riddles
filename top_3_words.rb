def top_3_words(text)
  hash = text.split(' ').reduce(Hash.new(0)) do |acc, value|
    word = value.downcase.gsub(/[^a-z']/, '')
    acc[word] += 1 if word.match(/\A\w+/)
    acc
  end

  hash.sort {|a, b| b[1].to_i <=> a[1].to_i }.take(3).map(&:first)
end



require 'minitest/autorun'

describe 'top 3 words' do
  it 'does not count special symbols' do
    assert_equal top_3_words("  , e  ' .. "), ['e']
  end

  it 'counts words' do
    assert_equal top_3_words("do or don't or don't"), %w(don't or do)
  end
end
