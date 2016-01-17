require_relative 'heap'

class PriorityQueue
  def initialize
    @heap = Heap.new
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
    @heap.item_at_index[0]
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
