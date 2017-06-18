def interpreter(code, tape)
  data_pointer = 0
  cmd_pointer = 0

  while cmd_pointer < code.size && data_pointer < tape.size && data_pointer >= 0
    case code[cmd_pointer]
      when ?> then data_pointer += 1
      when ?< then data_pointer -= 1
      when ?* then tape[data_pointer] = tape[data_pointer] == '0' ? '1' : '0'
      when ?[
        if tape[data_pointer] == '0'
          nested = 1
          while nested > 0
            case code[cmd_pointer += 1]
              when ?[ then nested += 1
              when ?] then nested -= 1
            end
          end
        end
      when ?]
        if tape[data_pointer] != '0'
          nested = 1
          while nested > 0
            case code[cmd_pointer -= 1]
              when ?[ then nested -= 1
              when ?] then nested += 1
            end
          end
        end
    end
    cmd_pointer += 1
  end

  tape
end



require 'minitest/autorun'

describe 'SmallFuck' do

  it 'works for sample cases' do
    assert_equal interpreter('*', '00101100'), '10101100'
    assert_equal interpreter('>*>*', '00101100'), '01001100'
    assert_equal interpreter('*>*>*>*>*>*>*>*', '00101100'), '11010011'
    assert_equal interpreter('*>*>>*>>>*>*', '00101100'), '11111111'
    assert_equal interpreter('>>>>>*<*<<*', '00101100'), '00000000'
  end

  it 'handles out-of-range tape access' do
    assert_equal interpreter('*>>>*>*>>*>>>>>>>*>*>*>*>>>**>>**', '0000000000000000'), '1001101000000111'
    assert_equal interpreter('<<<*>*>*>*>*>>>*>>>>>*>*', '0000000000000000'), '0000000000000000'
  end

end