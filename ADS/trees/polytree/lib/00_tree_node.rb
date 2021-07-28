class PolyTreeNode
  attr_reader :value, :parent
  attr_accessor :children
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(new_parent)
    is_root = @parent.nil?
    unless is_root
      @parent.children.delete(self)
    end

    @parent = new_parent
    is_root = @parent.nil?
    unless is_root
      @parent.children << self
    end 
  end


  def add_child(child_node)
    child_node.parent = self
    unless @children.include?(child_node)
      @children << child_node
    end
  end
  
  def remove_child(child_node)
    child_node.parent = nil
    raise "Node is not a child" unless @children.include?(child_node)
    @children.delete(child_node)
  end
end

