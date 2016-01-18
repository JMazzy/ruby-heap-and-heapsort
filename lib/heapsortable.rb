module Heapsortable
  def heap_sort(a)
    (a.size-1).downto(0).each do |i|
      sift_down(a,i,a.size-1)
    end

    last = a.size - 1
    loop do
      swap(a,0,last)
      last -= 1
      sift_down(a,0,last)
      break if last == 1
    end

    a
  end

  def sift_down(a, current, last)
    loop do
      # Get the priority child of the current node
      priority_child = priority_child(a,current)

      # Swap if there is a priority child found
      # and it is less than the value at the current index.
      # Break if the least child is larger than the current node
      # or if the current node has no children.
      if  !!priority_child && a[current] < a[priority_child] && priority_child < last
        swap(a, current, priority_child)
        current = priority_child
      else
        break
      end
    end
  end

  def priority_child(a, current)
    right = right(current)
    left = left(current)
    if both_children_present?(a,current)
      priority_child = a[left] > a[right] ? left : right
    elsif left_child_present?(a,current)
      priority_child = left
    elsif right_child_present?(a,current)
      priority_child = right
    else
      nil
    end
  end

  def swap(a,i,j)
    temp = a[i]
    a[i] = a[j]
    a[j] = temp
  end

  def both_children_present?(a,i)
    right_child_present?(a,i) && left_child_present?(a,i)
  end

  def right_child_present?(a,i)
    !!a[right(i)]
  end

  def left_child_present?(a,i)
    !!a[left(i)]
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
end
