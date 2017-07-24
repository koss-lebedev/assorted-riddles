Node = Struct.new(:value, :next)

def is_list_palindrome(list)
  arr = []
  node = list
  while node
    arr << node.value
    node = node.next
  end
  i, j = 0, arr.size-1
  while j > i
    return false if arr[i] != arr[j]
    i += 1
    j -= 1
  end

  true
end



def build_list(values)
  nxt = nil
  values.reverse_each { |i| nxt = Node.new(i, nxt) }
  nxt
end

require 'minitest/autorun'

describe 'solution' do
  it 'works for palindrome with even number of items' do
    list = build_list([1,2,2,1])
    assert_equal true, is_list_palindrome(list)
  end

  it 'works for palindrome with odd number of items' do
    list = build_list([1,2,1])
    assert_equal true, is_list_palindrome(list)
  end

  it 'handles non-palindromes' do
    list = build_list([1,2,3,1])
    assert_equal false, is_list_palindrome(list)
  end
end

