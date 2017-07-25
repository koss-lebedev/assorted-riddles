Node = Struct.new(:value, :next)

def middle_node(list)
  slow = list
  fast = list
  while slow && fast && fast.next
    slow = slow.next
    fast = fast.next.next
  end

  slow
end



def build_list(values)
  nxt = nil
  values.reverse_each { |i| nxt = Node.new(i, nxt) }
  nxt
end

require 'minitest/autorun'

describe 'solution' do
  it 'finds middle in list with even N of nodes' do
    list = build_list([1,2,3,4,5,6,7,8])
    assert_equal 5, middle_node(list).value
  end

  it 'finds middle in list with odd N of nodes' do
    list = build_list([1,2,3,4,5,6,7,8,9])
    assert_equal 5, middle_node(list).value
  end
end

