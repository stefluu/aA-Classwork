list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]

def my_min_I(arr)
  return arr[0] if arr.length == 1 
  
  sorted = false
  until sorted
    sorted = true
    
    arr.each_index do |idx|
      next if idx == arr.length - 1
      if arr[idx+1] < arr[idx]
        arr[idx], arr[idx+1] = arr[idx+1], arr[idx]
        sorted = false
      end
    end
  end 
  arr[0]
end

def my_min_II(arr)
  arr.reduce do |smallest, num|
    if num < smallest
      smallest = num
    else
      smallest
    end
  end
end

def largest_con_sub_sum_I(arr)
  result = []
  arr.each_index do |idx1|
    arr.each_index do |idx2|
      result << arr[idx1..idx2]
    end
  end
  result.delete([])
  
  largest_subset =
  result.reduce do |largest, subarr|
    if subarr.reduce(:+) > largest.reduce(:+)
      largest = subarr
    else
      largest
    end
  end
  largest_subset.reduce(:+)
end

def subsets(arr)
  return [[]] if arr.empty?
  previous = largest_con_sub_sum_II(arr[0..-2])
  previous + previous.map( |num| num += [arr.last])
end

def largest_con_sub_sum_II(arr)
  largest_num = arr.first
  current_num = arr.first
  
  (arr.length).times do |i|
    current_num = 0 if current_num < 0
    current_num += arr[i]
    largest_num = current_num if current_num > largest_num
  end

  largest_num
end

