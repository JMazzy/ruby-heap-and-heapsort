require 'min_heap'

describe "MinHeap" do

  let(:heap) { MinHeap.new([10,9,8,7,6,5,4,3,2,1,0]) }

  describe "#initialize" do
    it "puts the lowest value in the root (index 0)" do
      expect(heap.item_at_index(0)).to eq(0)
    end
  end

  describe "#add" do
    it "adding a lower item changes the root item" do
      heap.add(-5)
      expect(heap.item_at_index(0)).to eq(-5)
    end

    it "adding several items leaves the expected item on top" do
      heap.add(-5)
      heap.add(2)
      heap.add(-2)
      heap.add(23)
      expect(heap.item_at_index(0)).to eq(-5)
    end
  end

  describe "#remove" do
    it "removing the root item finds the new lowest item" do
      expect(heap.remove).to eq(0)
      expect(heap.item_at_index(0)).to eq(1)
    end

    it "removing several items finds the new lowest item" do
      expect(heap.remove).to eq(0)
      expect(heap.remove).to eq(1)
      expect(heap.remove).to eq(2)
      expect(heap.item_at_index(0)).to eq(3)
    end
  end
end
