PRECEDENCE = { '-' => 1, '+' => 1, '*' => 2, '/' => 2 }

class Calculator
  def evaluate(string)
    postfix = []
    stack = []

    string.split(' ').each do |term|
      if term.match /(\/|\+|-|\*)/
        while !stack.empty? && PRECEDENCE[term] <= PRECEDENCE[stack.last]
          postfix << stack.pop
        end
        stack << term
      else
        postfix << term
      end

    end

    until stack.empty?
      postfix << stack.pop
    end

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
        else stack << Integer(term)
      end
    end

    stack.first

  end
end



require 'minitest/autorun'

describe 'Calculator' do
  it 'calculates expression with same precedence operators' do
    assert_equal Calculator.new.evaluate('2 - 3 - 4'), -5
  end

  it 'calculates expression with different precedence operators' do
    assert_equal Calculator.new.evaluate('2 / 2 + 3 * 4 - 6'), 7
  end
end
