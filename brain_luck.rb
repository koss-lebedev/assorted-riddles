def brain_luck(code, input)
  output = ''
  data = []

  data_pointer = 0
  cmd_pointer = 0

  while cmd_pointer < code.size
    cmd = code[cmd_pointer]
    case cmd
      when ?> then data_pointer += 1
      when ?< then data_pointer -= 1
      when ?+ then data[data_pointer] = (data.fetch(data_pointer) { 0 } + 1) % 256
      when ?- then data[data_pointer] = (data.fetch(data_pointer) { 0 } - 1) % 256
      when ?. then output += data[data_pointer].chr
      when ?, then data[data_pointer] = input.slice!(0).ord
      when ?[
        if data[data_pointer] == 0
          nested = 1
          while nested > 0
            case code[cmd_pointer += 1]
              when ?[ then nested += 1
              when ?] then nested -= 1
            end
          end
        end
      when ?]
        if data[data_pointer] != 0
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

  output
end


require 'minitest/autorun'

describe 'BrainLuck' do

  it 'echos until byte(255) encountered' do
    assert_equal(
        brain_luck(',+[-.,+]', 'Codewars' + 255.chr),
        'Codewars'
    )
  end

  it 'echos until byte(0) encountered' do
    assert_equal(
        brain_luck(',[.[-],]', 'Codewars' + 0.chr),
        'Codewars'
    )
  end

  it 'Multiplies two numbers' do
    assert_equal(
        brain_luck(',>,<[>[->+>+<<]>>[-<<+>>]<<<-]>>.', 8.chr + 9.chr),
        72.chr
    )
  end

end