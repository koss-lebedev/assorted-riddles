def loop_size(node)
  nodes = []
  while node && !nodes.include?(node)
    nodes << node
    node = node.next
  end

  nodes.size - nodes.index(node)
end



require 'minitest/autorun'

class Node

  attr_accessor :next

  def initialize
    @next = nil
  end

end

def create_chain_for_test(tail_size, loop_size)
  prev_node = start = Node.new
  start.next = start
  return start if loop_size == 1
  (1..tail_size).each do |i|
    prev_node.next = Node.new
    prev_node = prev_node.next
  end
  end_loop = prev_node
  (1...loop_size).each do |i|
    prev_node.next = Node.new
    prev_node = prev_node.next
  end
  prev_node.next = end_loop
  start
end

describe 'loop size func' do
  it 'calculates loop size' do
    node = create_chain_for_test(2, 20)
    assert_equal 20, loop_size(node)
  end
end
