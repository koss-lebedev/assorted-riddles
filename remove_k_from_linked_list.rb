Node = Struct.new(:value, :next)

def remove_k_from_list(list, k)
  head = list
  prev = nil
  node = list
  while node
    if node.value == k
      if prev
        prev.next = node.next
      else
        head = node.next
      end
    else
      prev = node
    end
    node = node.next
  end

  head
end



def build_list(values)
  nxt = nil
  values.reverse_each { |i| nxt = Node.new(i, nxt) }
  nxt
end

def get_values(list)
  values = []
  node = list
  while node
    values << node.value
    node = node.next
  end
  values
end

require 'minitest/autorun'

describe 'solution' do
  it 'removes all instances of 3' do
    list = build_list([0, 1, 2, 3, 4, 5, 3, 6])
    p list
    expected = [0, 1, 2, 4, 5, 6]
    actual = remove_k_from_list(list, 3)
    assert_equal(expected, get_values(actual))
  end

  it 'removes all items' do
    list = build_list([10, 10])
    actual = remove_k_from_list(list, 10)
    assert_equal([], get_values(actual))
  end
end