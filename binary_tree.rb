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
  	tree = []
  	array.each { |element| insert_in_tree(element, tree) }
  	# tree.each do |branch|
  	#   p branch
  	# end
  	# p tree
  end

  def insert_in_tree(element, tree)
  	tree << Node.new(element) if tree.empty?
  	root = tree.first
  	tree.each do |branch|

  	  if element < branch.value && branch.left_child.nil?
  	  	node = Node.new(element, branch)
  	  	tree << node
  	  	branch.left_child = node
  	  	break
  	  end

  	  if element > branch.value && branch.right_child.nil?
  	  	node = Node.new(element, branch)
  	  	tree << node
  	  	branch.right_child = node
  	  	break
  	  end

  	end
  	
  	

  end

end

bn = BinaryTree.new
bn.build_tree([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]).inspect
# puts bn.tree

