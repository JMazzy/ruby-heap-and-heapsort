class Heap

  ROOT_INDEX = 0

  def initialize(array=[])
    @heap_array = array
    heapify
  end

  def add(item)
    # Add the item to the end of the array
    @heap_array << item

    # Do a sift-up operation to get it to its place
    sift_up(size-1)
  end

  def remove
    # Swap the first item with the last
    swap(ROOT_INDEX,size-1)

    # Pop off the last
    item = @heap_array.pop

    # Do a sift-down operation to get it to its place
    sift_down(ROOT_INDEX)

    # Return the removed item
    return item
  end

  # sorts the heap and returns the sorted array
  def heap_sort
    new_arr = []
    size.times { new_arr << remove }
    @heap_array = new_arr
  end

  # convenience method to retrieve a value at a certain index
  def item_at_index(i)
    @heap_array[i]
  end

  # the size of the heap
  def size
    @heap_array.size
  end

  def inspect
    # TODO: make this actually print it out in a visually tree-like way using print_heap
    string = ""
    @heap_array.each { |item| string << "#{item} " }
    string
  end

  def print_heap(i)
    # TODO: make this actually print it out in a visually tree-like way
    return if i > @heap_array.size - 1
    print "#{@heap_array[i]} \n"
    print_heap(left(i))
    print_heap(right(i))
  end

  private

  def heapify
    # Sift down all nodes above the last parent
    (parent(size-1)).downto(ROOT_INDEX).each do |i|
      sift_down(i)
    end
  end

  def sift_up(current)
    # Parent of the current node
    parent = parent(current)

    # Loop back up, swapping up the heap until the node is in the proper place
    while(current > 0 && @heap_array[current] < @heap_array[parent])
      swap(current,parent)
      current = parent
      parent = parent(current)
    end
  end

  def sift_down(current)
    loop do
      # Get the priority child of the current node
      least_child = least_child(current)

      # Swap if there is a priority child found
      # and it is less than the value at the current index.
      # Break if the least child is larger than the current node
      # or if the current node has no children.
      if  !!least_child &&
          @heap_array[least_child] < @heap_array[current]
        swap(current,least_child)
        current = least_child
      else
        break
      end
    end
  end

  def least_child(current)
    right = right(current)
    left = left(current)
    if both_children_present?(current)
      least_child = @heap_array[left] < @heap_array[right] ? left : right
    elsif left_child_present?(current)
      least_child = left
    elsif right_child_present?(current)
      least_child = right
    else
      nil
    end
  end

  def both_children_present?(i)
    right_child_present?(i) && left_child_present?(i)
  end

  def right_child_present?(i)
    !!@heap_array[right(i)]
  end

  def left_child_present?(i)
    !!@heap_array[left(i)]
  end

  def parent(i)
    ((i-1)/2).floor
  end

  def left(i)
    2*i + 1
  end

  def right(i)
    2*i + 2
  end

  def swap(i,j)
    temp = @heap_array[i]
    @heap_array[i] = @heap_array[j]
    @heap_array[j] = temp
  end
end
#
# heap = Heap.new([4,5,3,8,6,12,0])
# p heap
