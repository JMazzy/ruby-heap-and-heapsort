require_relative 'heap'

class Array
  def heap_sort
    Heap.new(self.dup).heap_sort
  end

  def heap_sort!
    replace(heap_sort)
  end
end
