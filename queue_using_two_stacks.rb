class StackQueue

  def initialize
    @main_stack = []
    @aux_stack = []
  end

  def enqueue(value)
    main_stack << value
  end

  def dequeue
    requeue
    aux_stack.pop
  end

  def peek
    requeue
    aux_stack.last
  end

private

  attr_reader :main_stack, :aux_stack

  def requeue
    if aux_stack.empty?
      aux_stack << main_stack.pop until main_stack.empty?
    end
  end

end

def process(commands)
  queue = StackQueue.new
  output = []

  commands.each do |cmd|
    case cmd[0]
    when ?1
      _, val = cmd.split(' ')
      queue.enqueue val
    when ?2 then queue.dequeue
    when ?3 then output << queue.peek
    end

  end

  output
end



require 'minitest/autorun'

describe 'solution' do
  it 'works with provided example' do
    commands = ['10', '1 42', '2', '1 14', '3', '1 28', '3', '1 60', '1 78', '2', '2']
    assert_equal(['42', '42'], process(commands))
  end
end
