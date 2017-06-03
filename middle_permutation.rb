def middle_permutation(str)
  chars = str.chars.sort

  # we only need half of permutations since they are generated in order
  count = (1..chars.size).reduce(1, :*) / 2
  handler = Proc.new do |permutation|
    count -= 1
    return permutation if count.zero?
  end

  tracker = Hash[chars.map{ |c| [c, 1]}]
  permutate(chars, tracker, Array.new(chars.size), 0, handler)
end

def permutate(chars, tracker, result, level, block)
  if level != result.size
    chars.each do |char|
      next if tracker[char] == 0
      result[level] = char
      tracker[char] -= 1
      permutate(chars, tracker, result, level + 1, block)
      tracker[char] += 1
    end
  else
    block.call(result.join)
  end
end


puts middle_permutation('cba')

# "abc", "acb", "bac", "bca", "cab", "cba"
# So, The middle term is "bac".
