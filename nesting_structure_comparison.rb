class Array
  def same_structure_as(other)
    return false unless other.is_a?(Array)

    self.each_with_index do |item, index|
      if item.is_a?(Array)
        if other[index].is_a?(Array)
          if item.size != other[index].size || !item.same_structure_as(other[index])
            return false
          end
        else
          return false
        end
      end
    end

    true
  end
end



require 'minitest/autorun'

describe 'Array' do

  it 'has same structure as' do
    assert_equal [1, [1, 1]].same_structure_as([2, [2, 2]]), true
  end

  it 'does not have same structure as' do
    assert_equal [1, [1, 1]].same_structure_as([[2, 2], 2]), false
  end

  it 'handles special short-cuts' do
    assert_equal [1, '[', ']'].same_structure_as(['[', ']', 1]), true
  end

  it 'checks input arguments' do
    assert_equal [].same_structure_as(1), false
  end

  it 'checks that arrays are of the same length' do
    assert_equal [1, [1, 1]].same_structure_as([2, [2]]), false
  end

end