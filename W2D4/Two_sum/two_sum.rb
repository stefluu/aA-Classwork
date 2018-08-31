require 'byebug'
def bad_two_sum?(arr, target) # O(n^2)
  arr.each_with_index do |num1, idx1|
    arr.each_with_index do |num2, idx2|
      next if idx2 == idx1
      return true if num1 + num2 == target
    end
  end
  false
end

def okay_two_sum?(arr, target) #O(nlogn) or O(n^2)
  sorted_arr = arr.sort
  sorted_arr.bsearch do |num|
    if (target - num) == 0
      return true
    end
  end
  false
end 

def two_sum?(arr, target) #O(n)
  hsh = Hash.new{[]}
  arr.each_with_index do |n, idx|
    hsh[n] = target - n
  end
  
  arr.each do |num|
    return true if hsh.has_key?(hsh[num])
  end
  false
end