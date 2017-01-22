class Node < Struct.new(:left, :right)

  def perfect?
    queue = [ [self, 1] ]
    max_depth = nil
    until queue.empty?
      node, depth = queue.shift

      if (node.left && !node.right) || (!node.left && node.right)
        return false
      elsif !node.left && !node.right
        if max_depth && max_depth != depth
          return false
        else
          max_depth = depth
        end
      end

      queue << [node.left, depth + 1] if node.left
      queue << [node.right, depth + 1] if node.right
    end

    true
  end

end


root = Node.new(
    Node.new(
        Node.new(nil, nil),
        Node.new(nil, nil)
    ),
    Node.new(
        Node.new(nil, nil),
        Node.new(nil, nil)
    )
)

require 'minitest/autorun'

describe 'PerfectTree' do

  it 'is root-only tree' do
    root = Node.new(nil, nil)
    assert_equal(true, root.perfect?)
  end

  it 'is full one-level' do
    root = Node.new( Node.new(nil, nil), Node.new(nil, nil) )
    assert_equal(true, root.perfect?)
  end

  it 'is one child tree' do
    root = Node.new( Node.new(nil, nil), nil )
    assert_equal(false, root.perfect?)
  end

end