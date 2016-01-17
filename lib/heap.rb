class Heap

  ROOT_INDEX = 0

  def initialize(array=[])
    @heap_array = array
    heapify
  end

  # convenience method to retrieve a value at a certain index
  def item_at_index(i)
    @heap_array[i]
  end

  # the size of the heap
  def size
    @heap_array.size
  end

  # sorts the heap and returns the sorted array
  def heap_sort
    new_arr = []
    size.times { new_arr << remove }
    @heap_array = new_arr
  end

  def add(item)
    @heap_array << item
    sift_up(@heap_array.size-1)
  end

  def remove
    swap(0,@heap_array.size-1)
    item = @heap_array.pop
    sift_down(0)
    return item
  end

  def inspect
    string = ""
    @heap_array.each { |item| string << "#{item} " }
    string
  end

  def print_heap(i)
    return if i > @heap_array.size - 1
    print "#{@heap_array[i]} \n"
    print_heap(left(i))
    print_heap(right(i))
  end

  private

  def heapify
    # parent(@heap_array.length-1).downto(0).each do |i|
    (@heap_array.size-1).downto(0).each do |i|
      sift_down(i)
    end
  end

  def sift_up(i)
    parent = parent(i)

    while(i > 0 && @heap_array[i] < @heap_array[parent])
      swap(i,parent)
      i = parent
      parent = parent(i)
    end
  end

  def sift_down(current)
    loop do
      least_child = least_child(current)

      if !!least_child && @heap_array[least_child] < @heap_array[current]
        # swap if
        swap(current,least_child)
        current = least_child
      else
        # break if the least child is larger than the current node
        # or if the current node has no children
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

# pseudocode for a binary heap
# Instance variables needed
  # Heap array - array which stores the heap
# Methods needed-
  # heapify an array
  # children(i) = at indices 2i + 1, 2i + 2
  # parent = at index floor((i-1)/2)
  # peek - returns the root
  # size - returns the size
  # empty? - true if it is empty
  # sift_up
    #
  # sift_down
  # private
  # swap function
  # compare function
