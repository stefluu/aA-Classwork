require 'byebug'
class MaxIntSet
  def initialize(max)
    @store = Array.new(max){false}
  end

  def insert(num)
    is_valid?(num)
    @store[num] = true
  end

  def remove(num)
    is_valid?(num)
    @store[num] = false
  end

  def include?(num)
    is_valid?(num)
    validate!(num)
  end

  private

  def is_valid?(num)
    raise "Out of bounds" unless num < @store.length && num > 0
  end

  def validate!(num)
    @store[num]
  end
end

class IntSet
  attr_accessor :store
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num
  end

  def remove(num)
    if include?(num)
      self[num].delete(num)
    else
      raise "It's not here!"
    end 
  end

  def include?(num)
    self[num].each { |n| return true if n == num }
    false
  end

  private
  
  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

end

class ResizingIntSet
  attr_reader :count
  attr_accessor :store

  def initialize(num_buckets = 2)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
    @bank = []
  end

  def insert(num)
    unless self[num].include?(num)
      self[num] << num
      # @bank << num 
      @count += 1
      resize! if @count > num_buckets
    end 
  end

  def remove(num)
    if include?(num)
      self[num].delete(num)
      @count -= 1
    end 
  end

  def include?(num)
    self[num].each { |n| return true if n == num }
    false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]    
  end

  def num_buckets
    @store.length
  end

  def resize!(*args)
    @count = 0
    store = @store 
    @store = Array.new(num_buckets*2) { Array.new }
    store.flatten.each { |el| insert(el) }
    # bank = @bank.dup
    # @bank = []
    # bank.each { |el| insert(el) }
  end
end
