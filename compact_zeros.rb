module Compactor

  def self.call(array)
    empty_index = nil
    array.size.times do |index|
      if array[index] == 0
        empty_index = index if empty_index.nil?
      else
        if empty_index
          array[empty_index] = array[index]
          array[index] = 0
          empty_index += 1
        end
      end
    end
    array.slice!(empty_index, array.size - empty_index) if empty_index
  end

end



require 'minitest/autorun'

describe 'Compactor' do
  it 'compacts empty array' do
    actual = []
    Compactor.call actual
    assert_equal actual, []
  end

  it 'compacts array of zeros' do
    actual = [0, 0, 0]
    Compactor.call actual
    assert_equal actual, []
  end

  it 'compacts array of non-zeros' do
    actual = [1, 2, 3]
    Compactor.call actual
    assert_equal actual, [1, 2, 3]
  end

  it 'compacts array starting with zero' do
    actual = [0, 1, 0, 2]
    Compactor.call actual
    assert_equal actual, [1, 2]
  end

  it 'compacts array starting with non-zero' do
    actual = [1, 2, 0, 0, 3, 0, 4]
    Compactor.call actual
    assert_equal actual, [1, 2, 3, 4]
  end
end