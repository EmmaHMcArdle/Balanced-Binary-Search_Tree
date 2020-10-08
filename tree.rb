class Tree
  
  attr_accessor :arr, :root, :queue, :depth, :in_order_arr

  def initialize(arr)
    @arr = arr.uniq.sort
    @root = built_tree(@arr)
    @queue = []
    @depth = 0
    @in_order_arr = []
  end


  # function to convert sorted array into a balanced BST
  # input: sorted array of integers
  # output: root node of balanced BST
  
  def built_tree(arr = @arr)
   
    if arr.length == 1
      return root = Node.new(arr[0])
    elsif arr.length == 0
      return nil
    else
    # Finds midpoint
      mid = arr.length / 2

      # creates the midpoint as the root
      root = Node.new(arr[mid])

      root.left = built_tree(arr[0..(mid - 1)])
    
      root.right = built_tree(arr[(mid + 1)..-1])
    
      return root
    end
  end

  def insert(root, key)
    # If the tree is empty, return a new node
    if root.nil? || root == 0
      return Node.new(key)
    # Otherwise recur down the tree
    else
      if root.data == key
        return root
      elsif root.data < key
        root.right = insert(root.right, key)
      else
        root.left = insert(root.left, key)
      end
    end
    return root
  end

  def inorder(root)
    if !root.nil? && root != 0
      inorder(root.left)
      print " #{root.data} "
      @in_order_arr << root.data
      inorder(root.right)
    end
  end

  def preorder(root)
    if !root.nil? && root != 0
      print " #{root.data} "
      preorder(root.left)
      preorder(root.right)
    end
  end

  def postorder(root)
    if !root.nil? && root != 0
      postorder(root.left)
      postorder(root.right)
      print " #{root.data} "
    end
  end

  def height(node)
    if node == 0 || node.nil?
      return 0
    else
        left_height = height(node.left)
        right_height = height(node.right)
      if left_height > right_height
        return left_height + 1
      else
        return right_height + 1
      end
    end
  end

  def depth(root, node)
    if node == 0 || node.nil?
      return 0
    else
      if node == root.data
        return @depth
      elsif node < root.data
        @depth += 1
        depth(root.left, node)
      elsif node > root.data
        @depth += 1
        depth(root.right, node)
      else
        return "No node of that value"
      end
    end
  end

  def balanced?(root)
    # Base condition
    if root == 0 || root.nil?
      return true
    end
    # for left and right subtree height
    left_height = height(root.left)

    right_height = height(root.right)


    # Acceptable values for left_height - right_height are 1, -1, 0
    diff = left_height - right_height
    abs_diff = diff.abs
    if abs_diff <= 1 && balanced?(root.left) == true && balanced?(root.right) == true
      return true
    end
    # If we reach here it means tree is not height-balanced tree
    return false
  end

  def rebalance()
    built_tree(in_order_arr)
  end
        


  def level_order(root)
   h = height(root)
   for i in (1..h+1)
    printGivenLevel(root, i)
   end
  end

  def printGivenLevel(root, level)
    if root.nil? || root == 0
      return
    end
    if level == 1
      print root.data.to_s + " "
    else
      printGivenLevel(root.left, level-1)
      printGivenLevel(root.right, level-1)
    end
  end

  def find(root, key)
    if root.nil? || root == 0 || root.data == key
      return root
    end

    if root.data < key
      return find(root.right, key)
    end
    
    return find(root.left, key)
  end

  def minValueNode(node)
    unless node.left.nil? || node.left == 0
      node = node.left
    end
    return node
  end

  def delete(root, data)
   # Base case
    if root.nil?
      puts "In base case!"
      return root
    end
    # If the key to be deleted is smaller than the root's key then it lies in left subtree
    if data < root.data
      root.left = delete(root.left, data)
    
      #If the key to be deleted is greater than the root's key then it lies in right subtree
    elsif data > root.data
      root.right = delete(root.right, data)
    
    else
      # Node with only one child or no child
      if root.left.nil? || root.left == 0
        temp = root.right
        root = nil
        return temp

      elsif root.right.nil? || root.right == 0
        temp = root.left
        root = nil
        return temp
      end
      # Node with two children: get the inorder successor (smallest to the tight subtree_)
      temp = minValueNode(root.right)

      # Copy the inorder successor's content to this node
      root.data = temp.data

      # Delete the inoder successor
      root.right = delete(root.right, temp.data)
    end
    return root
  end



  def pretty_print(node = @root, prefix = '', is_left = true)
    unless node == 0
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
    end
  end
end