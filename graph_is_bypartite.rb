class Node < Struct.new(:value, :color, :adj_nodes)
  def initialize(value)
    super(value, :gray, [])
  end
end

class GraphProcessor
  def initialize(node)
    @node = node
  end

  def bipartite?
    queue = [[node, :red]]
    until queue.empty?
      item, color = queue.shift
      item.color = color if item.color == :gray
      return false if item.adj_nodes.count { |n| n.color == item.color } > 0
      new_color = color == :red ? :black : :red
      item.adj_nodes.select{ |n| n.color == :gray }.each do |node|
        queue << [node, new_color]
      end
    end

    true
  end

private

  attr_reader :node

end


require 'minitest/autorun'

describe 'GraphProcessor' do

  it 'is not bipartite' do
    a, b, c, d = (1..4).map { |value| Node.new(value) }
    a.adj_nodes = [b]
    b.adj_nodes = [a,c,d]
    c.adj_nodes = [b,d]
    d.adj_nodes = [b,c]

    assert_equal GraphProcessor.new(a).bipartite?, false
  end

  it 'is bipartite' do
    a, b, c, d = (1..4).map { |value| Node.new(value) }
    a.adj_nodes = [b]
    b.adj_nodes = [a,c]
    c.adj_nodes = [b,d]
    d.adj_nodes = [c]

    assert_equal GraphProcessor.new(a).bipartite?, true
  end

  it 'is complete bipartite' do
    a,b,c,d,e,f,g,h = (1..8).map { |value| Node.new(value) }
    a.adj_nodes = [f,g,h]
    b.adj_nodes = [f,g,h]
    c.adj_nodes = [f,g,h]
    d.adj_nodes = [f,g,h]
    e.adj_nodes = [f,g,h]
    f.adj_nodes = [a,b,c,d,e]
    g.adj_nodes = [a,b,c,d,e]
    h.adj_nodes = [a,b,c,d,e]

    assert_equal GraphProcessor.new(a).bipartite?, true
  end

end