def first_anagram?(word1, word2)
  permutations = word1.chars.permutation(word1.length).to_a
  # include?(word2)
  permutations.map!{|permutation| permutation.join}
  
  permutations.include?(word2)
end

def second_anagram?(word1, word2)
  word1.each_char do |ch|
    idx = word2.index(ch)
    word2 = word2[0...idx] + word2[idx+1 ..-1]
  end
  word2 == ""
end

def third_anagram?(word1, word2)
  word1.chars.sort == word2.chars.sort
end

def fourth_anagram?(word1, word2)
  new_hash = Hash.new { |h,k| h[k] = [] }
  word1.each_char do |ch|
    new_hash[ch] << word1.count(ch)
    new_hash[ch] << word2.count(ch)    
  end
  
  new_hash.values.all? { |value| value.first == value.last }
end