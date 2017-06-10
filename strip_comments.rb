def solution(input, markers)
  regex = /\s?(#{markers.map { |m| "\\#{m}"}.join('|')}).*$/
  input.gsub(regex, '')
end



require 'minitest/autorun'

describe 'solution' do
  it 'removes comments' do
    result = solution("apples, pears # and bananas\ngrapes $hey\nbananas !apples", %w(# ! $))
    p result
    assert_equal result, "apples, pears\ngrapes\nbananas"
  end
end
