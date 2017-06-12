def calc(expr)
  stack = []
  postfix = expr.split(' ')

  postfix.each do |term|
    case term
      when ?+ then stack << stack.pop + stack.pop
      when ?- then
        a, b = stack.pop, stack.pop
        stack << b - a
      when ?* then stack << stack.pop * stack.pop
      when ?/ then
        a, b = stack.pop, stack.pop
        stack << b / a
      else stack << Float(term)
    end
  end

  stack.last || 0
end



require 'minitest/autorun'

describe 'calc' do
  it 'works with empty string' do
    assert_equal 0, calc('')
  end

  it 'parses ints' do
    assert_equal 3, calc('1 2 3')
  end

  it 'parses floats' do
    assert_equal 3.5, calc('1 2 3.5')
  end

  it 'supports addition' do
    assert_equal 4, calc('1 3 +')
  end

  it 'supports multiplication' do
    assert_equal 3, calc('1 3 *')
  end

  it 'supports subtraction' do
    assert_equal -2, calc('1 3 -')
  end

  it 'supports division' do
    assert_equal 2, calc('4 2 /')
  end

  it 'calculates complex expr' do
    assert_equal 14, calc('5 1 2 + 4 * + 3 -')
  end
end
