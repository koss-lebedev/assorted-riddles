def justify(text, width)
  result = ''
  words = []
  size = 0

  text.split(' ').each do |word|

    if size + word.size + words.size > width
      gap_count = words.size - 1

      if gap_count.zero?
        result += words.first + "\n"
      else
        gap_size, rem = (width - size).divmod(gap_count)

        words.each_with_index do |word, i|
          gap = i >= rem ? gap_size : gap_size + 1

          if i == words.size - 1
            result += word + "\n"
          else
            result += word + ' ' * gap
          end
        end
      end

      words = [word]
      size = word.size
    else
      words << word
      size += word.size
    end
  end

  result + words.join(' ')
end



require 'minitest/autorun'

text = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis dolor mauris, at elementum ligula tempor eget.'

describe 'justify function' do
  it 'justifies with width 15' do
    expected = "Lorem     ipsum\ndolor sit amet,\nconsectetur\nadipiscing\nelit.\nVestibulum\nsagittis  dolor\nmauris,      at\nelementum\nligula   tempor\neget."
    assert_equal justify(text, 15), expected
  end

  it 'justifies with width 20' do
    expected = "Lorem   ipsum  dolor\nsit            amet,\nconsectetur\nadipiscing     elit.\nVestibulum  sagittis\ndolor   mauris,   at\nelementum     ligula\ntempor eget."
    assert_equal justify(text, 20), expected
  end

  it 'justifies with width 30' do
    expected = "Lorem  ipsum  dolor  sit amet,\nconsectetur  adipiscing  elit.\nVestibulum    sagittis   dolor\nmauris,  at  elementum  ligula\ntempor eget."
    assert_equal justify(text, 30), expected
  end
end
