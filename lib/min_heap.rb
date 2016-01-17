require_relative 'heap'

class MinHeap < Heap
  def match_heap_property?(parent,child)
    @heap_array[parent] < @heap_array[child]
  end
end
