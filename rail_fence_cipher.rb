def encode_rail_fence_cipher(str, num_rails)
  result = Array.new(num_rails) { [] }
  i = 0
  rail = 0
  down = true
  while str[i]
    result[rail] << str[i]
    i += 1
    if down
      rail += 1
    else
      rail -= 1
    end

    down = false if rail == num_rails - 1
    down = true if rail == 0
  end

  result.map(&:join).join
end

def decode_rail_fence_cipher(str, num_rails)
  result = '*' * str.size
  max_gap = (num_rails - 1) * 2
  rail = 0
  target_index = 0
  odd = true

  str.chars.each do |char|
    result[target_index] = char

    offset = if rail == 0 || rail == num_rails - 1
               max_gap
             else
               odd ? max_gap - rail*2 : rail*2
             end

    odd = !odd
    target_index += offset

    if target_index >= result.size
      rail += 1
      target_index = rail
      odd = true
    end
  end

  result
end



require 'minitest/autorun'

describe 'rail fence' do
  it 'encodes with 3 rails' do
    assert_equal(encode_rail_fence_cipher('WEAREDISCOVEREDFLEEATONCE', 3), 'WECRLTEERDSOEEFEAOCAIVDEN')
  end

  it 'encodes with 5 rails' do
    assert_equal(encode_rail_fence_cipher('WEAREDISCOVEREDFLEEATONCE', 5), 'WCLEESOFECAIVDENRDEEAOERT')
  end

  it 'decodes with 3 rails' do
    assert_equal(decode_rail_fence_cipher('WECRLTEERDSOEEFEAOCAIVDEN', 3), 'WEAREDISCOVEREDFLEEATONCE')
  end

  it 'decodes with 5 rails' do
    assert_equal(decode_rail_fence_cipher('WCLEESOFECAIVDENRDEEAOERT', 5), 'WEAREDISCOVEREDFLEEATONCE')
  end
end
