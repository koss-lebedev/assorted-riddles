def top_3_words(text)
  hash = text.split(' ').reduce(Hash.new(0)) do |acc, value|
    word = value.downcase.gsub(/[^a-z']/, '')
    acc[word] += 1 if word.match(/\A\w+/)
    acc
  end

  p hash
  hash.sort {|a, b| b[1].to_i <=> a[1].to_i }.take(3).map(&:first)
end



p top_3_words("  , e  ' .. ")