def pick_peaks(array)
  pos = []
  peak = nil
  (1...array.size).each do |index|
    if array[index] > array[index-1]
      peak = index
    elsif array[index] < array[index-1] && peak
      pos << peak
      peak = nil
    end
  end

  { pos: pos, peaks: pos.map { |p| array[p] } }
end



require 'minitest/autorun'

describe 'pick peaks' do

  it 'should support finding peaks' do
    assert_equal pick_peaks([1,2,3,6,4,1,2,3,2,1]), {pos: [3, 7], peaks: [6, 3]}
  end

  it 'should support finding peaks, but should ignore peaks on the edge of the array' do
    assert_equal pick_peaks([3,2,3,6,4,1,2,3,2,1,2,3]), {pos: [3,7], peaks: [6,3]}
  end

  it 'should support finding peaks; if the peak is a plateau, it should only return the position of the first element of the plateau' do
    assert_equal pick_peaks([3,2,3,6,4,1,2,3,2,1,2,2,2,1]), {pos: [3,7,10], peaks: [6,3,2]}
  end

  it 'should support finding peaks; if the peak is a plateau, it should only return the position of the first element of the plateau' do
    assert_equal pick_peaks([2,1,3,1,2,2,2,2,1]), {pos: [2,4], peaks: [3,2]}
  end

  it 'should support finding peaks, but should ignore peaks on the edge of the array' do
    p pick_peaks([2,1,3,1,2,2,2,2])
    assert_equal pick_peaks([2,1,3,1,2,2,2,2]), {pos: [2], peaks: [3]}
  end

end




