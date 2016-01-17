Implements a heap and the closely related priority queue in Ruby.

Contains a monkey-patch to add heap_sort and heap_sort! methods to Array.


Pseudocode for a binary heap
- Instance variables needed
  - Heap array - array which stores the heap
- Methods needed-
  - heapify an array
  - children(i) = at indices 2i + 1, 2i + 2
  - parent = at index floor((i-1)/2)
  - peek - returns the root
  - size - returns the size
  - empty? - true if it is empty
  - sift_up
  - sift_down
  - private
  - swap function
  - compare function
