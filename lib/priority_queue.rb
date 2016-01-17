require_relative 'min_heap'
require_relative 'max_heap'

class PriorityQueue
  def initialize(max_heap=false)
    @heap = max_heap ? MaxHeap.new : MinHeap.new
  end

  def enqueue(item,priority)
    packet = Packet.new(item,priority)
    @heap.add(packet)
  end

  def dequeue
    packet = @heap.remove
    packet.data
  end

  def peek
    @heap.item_at_index(0).data
  end

  def size
    @heap.size
  end
end

class Packet
  include Comparable

  attr_reader :data, :priority

  def initialize(data, priority)
    @data = data
    @priority = priority
  end

  def <=>(other_packet)
    @priority <=> other_packet.priority
  end
end
