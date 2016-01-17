require 'priority_queue'

describe "PriorityQueue" do

  let(:maxpq) { PriorityQueue.new(true) }
  let(:minpq) { PriorityQueue.new(false) }

  before do
    pets = { dog: 1, cat: 2, guinea_pig: 3, rabbit: 4, goldfish: 5 }

    pets.each do |pet, priority|
      maxpq.enqueue(pet.to_s, priority)
      minpq.enqueue(pet.to_s, priority)
    end
  end

  describe "#enqueue" do
    it "allows you to add an item with a priority" do
      maxpq.enqueue("pony",0)
      minpq.enqueue("pony",0)
      expect(maxpq.peek).to eq("goldfish")
      expect(minpq.peek).to eq("pony")
    end
  end

  describe "#dequeue" do
    it "retrieves the item with the highest priority" do
      expect(maxpq.dequeue).to eq("goldfish")
      expect(minpq.dequeue).to eq("dog")
    end

    it "allows you to remove an item from the queue" do
      maxpq.dequeue
      expect(maxpq.peek).to eq("rabbit")
      minpq.dequeue
      expect(minpq.peek).to eq("cat")
    end
  end

  describe "#peek" do
    it "allows you to view the top item non-destructively" do
      maxpq.peek
      expect(maxpq.peek).to eq("goldfish")
      minpq.peek
      expect(minpq.peek). to eq("dog")
    end
  end

  describe "size" do
    it "tells you the size of the queue" do
      expect(maxpq.size).to eq(5)
      expect(minpq.size).to eq(5)
    end

    it "changes as you enqueue" do
      maxpq.enqueue("pony",0)
      expect(maxpq.size).to eq(6)
    end

    it "changes as you dequeue" do
      minpq.dequeue
      expect(minpq.size).to eq(4)
    end
  end

end
