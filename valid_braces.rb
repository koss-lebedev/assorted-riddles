def valid_braces(braces)
  stack = []
  braces.chars.each do |char|
    if '({['.include? char
      stack << char
    else
      opposite = stack.pop
      case char
        when ?) then return false if opposite != '('
        when ?] then return false if opposite != '['
        when ?} then return false if opposite != '{'
      end
    end
  end

  stack.empty?
end



require 'minitest/autorun'

describe 'valid braces' do
  it 'should be valid' do
    assert_equal valid_braces('(){}[]'), true
  end

  it 'should be invalid' do
    assert_equal valid_braces('(}'), false
  end

  it 'should be invalid' do
    assert_equal valid_braces('[(])'), false
  end

  it 'should be valid' do
    assert_equal valid_braces('([{}])'), true
  end
end