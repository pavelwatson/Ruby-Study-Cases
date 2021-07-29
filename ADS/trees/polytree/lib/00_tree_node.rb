require_relative './searchable'

class PolyTreeNode
  include Searchable

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


  def inspect
    @value.inspect
  end
end


nodes = ('a'..'g').map { |value| PolyTreeNode.new(value) }
parent_index = 0
nodes.each_with_index do |node, ind|
  next if ind.zero?
  node.parent = nodes[parent_index]
  parent_index += 1 if ind.even?
end


# require "byebug"
# debugger

# p nodes[0].dfs('e')
p nodes[0].bfs('e')


