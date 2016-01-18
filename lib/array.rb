require_relative 'heapsortable'

class Array
  include Heapsortable

  def heapsort
    heap_sort(self.dup)
  end

  def heapsort!
    replace(heapsort)
  end
end

arr = [3,4,5,2,8,1]
p arr.heapsort

p arr
