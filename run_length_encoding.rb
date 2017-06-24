def encode(input)
  input.gsub!(/(.)\1*/) { |match| (match.size > 1 ? match.size.to_s : '') + match[0] }
end



require 'minitest/autorun'

describe 'encode function' do
  it 'returns correct result' do
    assert_equal encode('aaabb77daa8cccd'), '3a2b27d2a83cd'
  end
end
