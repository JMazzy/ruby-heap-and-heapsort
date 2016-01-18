require 'max_heap'

describe "MaxHeap" do

  let(:heap) { MaxHeap.new([0,1,2,3,4,5,6,7,8,9,10]) }

  describe "#initialize" do
    it "puts the largest value in the root (index 0)" do
      expect(heap.item_at_index(0)).to eq(10)
    end
  end

  describe "#add" do
    it "adding a larger item changes the root item" do
      heap.add(50)
      expect(heap.item_at_index(0)).to eq(50)
    end

    it "adding several items leaves the expected item on top" do
      heap.add(-5)
      heap.add(2)
      heap.add(-2)
      heap.add(23)
      expect(heap.item_at_index(0)).to eq(23)
    end
  end

  describe "#remove" do
    it "removing the root item finds the new largest item" do
      expect(heap.remove).to eq(10)
      expect(heap.item_at_index(0)).to eq(9)
    end

    it "removing several items finds the new largest item" do
      expect(heap.remove).to eq(10)
      expect(heap.remove).to eq(9)
      expect(heap.remove).to eq(8)
      expect(heap.item_at_index(0)).to eq(7)
    end
  end
end
