class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    unless self[key].include?(key)
      self[key] << key
      @count += 1
      resize! if @count > num_buckets
    end 
  end

  def include?(key)
    self[key].each { |n| return true if n == key }
    false
  end

  def remove(key)
    if include?(key)
      self[key].delete(key)
      @count -= 1
    end 
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num.hash % num_buckets]  
  end

  def num_buckets
    @store.length
  end

  def resize!
    @count = 0
    store = @store 
    @store = Array.new(num_buckets*2) { Array.new }
    store.flatten.each { |el| insert(el.hash) }
  end
end
