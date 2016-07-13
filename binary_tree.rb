class Node

  attr_accessor :value, :parent, :left_child, :right_child

  def initialize(value = nil, parent = nil, left_child = nil, right_child = nil)
  	@value = value
  	@parent = parent
  	@left_child = left_child
  	@right_child = right_child
  end

end

class BinaryTree

  attr_accessor :tree

  def initialize(root = nil)
    @root = Node.new(root)
  end

  def build_tree(array)
  	@tree = []
  	array.each { |element| insert_in_tree(element, @tree) }
  	# tree.each do |branch|
  	#   p branch
  	# end
  	# p tree
  end

  def insert_in_tree(element, tree)
  	@tree << Node.new(element) if @tree.empty?
  	@root = @tree.first

  	@tree.each do |branch|

  	  if element < branch.value && branch.left_child.nil?
  	  	node = Node.new(element, branch)
  	  	@tree << node
  	  	branch.left_child = node
  	  	break
  	  end

  	  if element > branch.value && branch.right_child.nil?
  	  	node = Node.new(element, branch)
  	  	@tree << node
  	  	branch.right_child = node
  	  	break
  	  end

  	end
  	
  end

  def breadth_first(target)
  	queue = []
  	visited = []

  	@tree.each do |branch|
  	  queue.unshift(branch)
  	  element = queue.first
  	  visited << element 
  	  return element if element.value == target

  	  if element.right_child && !visited.include?(element.right_child)
  	  	right = element.right_child
  	  	visited << right
  	  	return right if right.value == target
  	  end

  	  if element.left_child && !visited.include?(element.left_child)
  	  	left = element.left_child
  	  	visited << left
  	  	return left if left.value == target
  	  end
  	end

  	return nil

  end

  def depth_first(target)
  	stack = []
  	visited = []

  	element = @tree.first
  	stack << element
  	visited << element

  	while !stack.empty?
  	  element = stack.last
	  if element.value == target
	    return element
	  elsif element.left_child && !visited.include?(element.left_child)
	    left = element.left_child
	    stack << left
	    visited << left
	    return left if left.value == target
	  elsif element.right_child && !visited.include?(element.right_child)
	    right = element.right_child
	    stack << right
	    visited << right
	    return right if right.value == target
	  else
	  	stack.pop
	  end
	end

	return nil	  	
  	  	
  end

  def dfs_rec(target, element = @tree.first)
  	return element if element.value == target
  	dfs_rec(target, element.left_child) if element.left_child
  	dfs_rec(target, element.right_child) if element.right_child
  end

end

bn = BinaryTree.new
bn.build_tree([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]).inspect
# puts bn.tree
# puts bn.breadth_first(67).inspect
# puts bn.depth_first(67).inspect
puts bn.dfs_rec(7).inspect

