require "byebug"
class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    result = ""
    converted = self.each_with_index do |n, idx| 
      result << n.to_s
      result << idx.to_s
    end
    result.to_i
  end
end

class String
  def hash
    alphabet = ("a".."z").to_a + ("A".."Z").to_a
    result = ""
    
    self.each_char.with_index do |ch, idx|
      result << (alphabet.index(ch)).to_s
      result << idx.to_s
    end
    result.to_i
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  # { a: 1, b: 2 }
  # a1b2
  
  def hash
    
    result = ""
    hsh_arr = self.to_a
    hsh_arr.sort!
    
    hsh_arr.each do |subarr|
      substring = ""
      substring << (subarr[0].to_s.hash).to_s + "112107"
      substring << (subarr[1].hash).to_s + "55112"
      result += substring
    end
    result.to_i
    #0
  end
end
