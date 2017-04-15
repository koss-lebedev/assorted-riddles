def rotate_in_place(matrix)
  n = matrix[0].size
  cycles = n / 2
  cycles.times do |row|
    (n-1-row*2).times do |column|

      temp = matrix[row][row+column]
      matrix[row][row+column] = matrix[n-row-column-1][row]
      matrix[n-row-column-1][row] = matrix[n-row-1][n-row-column-1]
      matrix[n-row-1][n-row-column-1] = matrix[row+column][n-row-1]
      matrix[row+column][n-row-1] = temp
      
    end
  end

end



require 'minitest/autorun'


describe 'MatrixRotate' do

  it 'rotates matrix' do
    matrix = [[1, 2, 3, 4],
              [5, 6, 7, 8],
              [9, 10, 11, 12],
              [13, 14, 15, 16]]

    expected = [[13, 9, 5, 1],
                [14, 10, 6, 2],
                [15, 11, 7, 3],
                [16, 12, 8, 4]]

    rotate_in_place(matrix)

    assert_equal matrix, expected
  end

end