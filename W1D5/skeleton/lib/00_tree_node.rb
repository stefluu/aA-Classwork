require 'byebug'
class PolyTreeNode
  
  attr_reader :value
  attr_accessor :children, :parent
  
  def initialize(value, parent = nil)
    @value = value
    @parent = parent
    @children = []
  end
  
  def parent
    @parent
  end
  
  def children
    @children
  end
  
  def value
    @value
  end
  # 
  def parent=(node)
    if @parent  
      self.parent.children.delete(self)
    end
    @parent = node
    
    if @parent
      @parent.children << self  
    end
  end
    
  def add_child(child_node)
    # self.parent = child_node.parent(self)
    child_node.parent=(self)
    # self.children << child_node
  end
    
  def remove_child(child_node)
    raise_error if child_node.parent != self
    child_node.parent=(nil) #unless child_node.parent != self#(parent.children.include?(child_node)) == false
    # child_node.parent != self
  end
    
    
  def dfs(target_value)
    # debugger
    if self.value == target_value 
      return self 
    else
      p "<><><><><><><><"
      p self
      puts "{}{}{}{}{}"
      p "doo stufff"
      puts "{}{}{}{}{}"
      p self.children
      p "<><><><><"
      return nil if self.children.nil?
      
      if self.children.length > 0
        self.children.each do |child|
          result = child.dfs(target_value)
      
          if result != nil
            return result
          end
          # return result
          puts "EMPTY SPACE"
        end
      end
      
      
    end
    #   return self if self.value == target_value
    #   # return nil if self.children.nil?
    #   # if we have no child then go back to previous node
    #   if self.children.length > 0
    #     self.children.each do |child|
    # 
    #       child.dfs(target_value)
    #     end
    #   # else 
    #   #   return
    #   end  
    # 
    # end
    # #child cannot call parent= on parent
  end
  
  
  def inspect 
    child_string = ""
    @children.each {|child| child_string += child.value.to_s }
    #puts " nodes children is #{child_string}, values is #{self.value}, parent is #{self.parent} "
    puts "#{value}"
  
  end
  
end
# 
# one = PolyTreeNode.new(1)
# two = PolyTreeNode.new(2)
# one.add_child(two)
# 
# p "----------"
# p one 
# p "----------"
# p two 


