
def naive_max_window(arr, w)
  current_max_range = nil
  ranges_arr = []
  
  arr.each_with_index do |num, idx|
    break if idx == arr.length - w + 1
    ranges_arr << arr[idx...idx+w]
  end

  ranges_arr.map!{|subarr| find_range(subarr)}.max

end

def find_range(arr)
  min = arr.min
  max = arr.max
  max - min
end