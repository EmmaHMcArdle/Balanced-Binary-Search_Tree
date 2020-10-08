
require './tree'
require './node'

class TreeTester

  # Create a binary search tree from an arry of random numbers
  tree = Tree.new(Array.new(15) {rand(1..100)})
  print "Tree: "

  # Access the tree array and print
  arr = tree.arr
  print arr
  print "\n"

  #Read the root and print
  root = tree.root
  print "root: "
  print root.data
  print "\n"

  # Select the first random number that isn't in the BST and insert
  num = arr.sample
  until !arr.include? num
    num = rand(1..100)
  end
  print "#1 to insert: " + num.to_s + "\n"
  root = tree.insert(root, num)

  # Select the second random number that isn't in the BST and insert
  num = arr.sample
  until !arr.include? num
    num = rand(1..100)
  end
  print "#2 to insert: " + num.to_s + "\n"
  root = tree.insert(root, num)

  # Select the third random number that isn't in the BST and insert
  num = arr.sample
  until !arr.include? num
    num = rand(1..100)
  end
  print "#3 to insert: " + num.to_s + "\n"
  root = tree.insert(root, num)
  
  # Select a random number in the BST and delete
  del_num = arr.sample
  print "Number to delete: "
  puts del_num
  root = tree.delete(root, del_num)
  
  # Traverses BST in non-decreasing order
  print "Inorder: "
  tree.inorder(root)
  print "\n"
  
  # Traverses BST that starts at root then goes left, then right
  # Great to create a copy of tree
  print "Preorder: "
  tree.preorder(root)
  print "\n"

  # Traverses the left subtree, then the right subtree and then the root
  # Great to use to delete a tree
  print "Postorder: "
  tree.postorder(root)
  print "\n"

  # Breadth first - prints each level in order from the root to leaf nodes
  print "Level Order: "
  tree.level_order(root)
  print "\n"

  # Method shared on Discord for nice display of BST
  tree.pretty_print(root, "")

  print "Height of tree: "
  puts tree.height(root)

  depth_num = arr.sample
  print "Depth of #{depth_num}: "
  puts tree.depth(root, depth_num)

  print "Is tree balanced?: "
  puts tree.balanced?(root)
  
  # Find number's node
  find_num = arr.sample
  print "#{find_num} found at: "
  puts tree.find(root, find_num)

  new_root = tree.rebalance()
  tree.pretty_print(new_root, "")
  
end
