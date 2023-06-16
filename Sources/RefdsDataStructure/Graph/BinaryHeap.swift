import Foundation

/**
 A class representing a Binary Heap (min heap) data structure.
 */
public final class BinaryHeap<T: Comparable> {
    private var heap: [T]
    
    /**
     Initializes an empty Binary Heap.
     */
    public init() {
        heap = []
    }
    
    /**
     Initializes the Binary Heap with an array of elements.
     
     - Parameter elements: The elements to be added to the heap.
     */
    public init(elements: [T]) {
        heap = elements
        buildHeap()
    }
    
    /**
     Adds an element to the Binary Heap.
     
     - Parameter element: The element to be added.
     */
    public func insert(_ element: T) {
        heap.append(element)
        siftUp(from: heap.count - 1)
    }
    
    /**
     Removes and returns the minimum element from the Binary Heap.
     
     - Returns: The minimum element, or `nil` if the heap is empty.
     */
    public func extractMin() -> T? {
        guard !isEmpty else {
            return nil
        }
        
        let minElement = heap[0]
        let lastElement = heap.removeLast()
        
        if !isEmpty {
            heap[0] = lastElement
            siftDown(from: 0)
        }
        
        return minElement
    }
    
    /**
     Checks if the Binary Heap is empty.
     */
    public var isEmpty: Bool {
        return heap.isEmpty
    }
    
    /**
     Builds the heap from the given elements.
     */
    private func buildHeap() {
        for i in stride(from: heap.count / 2 - 1, through: 0, by: -1) {
            siftDown(from: i)
        }
    }
    
    /**
     Restores the heap property by sifting up the element at the given index.
     
     - Parameter index: The index of the element to sift up.
     */
    private func siftUp(from index: Int) {
        var childIndex = index
        var parentIndex = (childIndex - 1) / 2
        
        while childIndex > 0 && heap[childIndex] < heap[parentIndex] {
            heap.swapAt(childIndex, parentIndex)
            childIndex = parentIndex
            parentIndex = (childIndex - 1) / 2
        }
    }
    
    /**
     Restores the heap property by sifting down the element at the given index.
     
     - Parameter index: The index of the element to sift down.
     */
    private func siftDown(from index: Int) {
        let parentIndex = index
        let leftChildIndex = 2 * parentIndex + 1
        let rightChildIndex = 2 * parentIndex + 2
        var smallestIndex = parentIndex
        
        if leftChildIndex < heap.count && heap[leftChildIndex] < heap[smallestIndex] {
            smallestIndex = leftChildIndex
        }
        
        if rightChildIndex < heap.count && heap[rightChildIndex] < heap[smallestIndex] {
            smallestIndex = rightChildIndex
        }
        
        if smallestIndex != parentIndex {
            heap.swapAt(parentIndex, smallestIndex)
            siftDown(from: smallestIndex)
        }
    }
    
    /**
     A custom error type that represents an invalid operation on the Binary Heap.
     */
    public enum BinaryHeapError: Error {
        /**
         Indicates that the heap is empty.
         */
        case heapIsEmpty
        
        /**
         A title describing the error.
         */
        public var title: String {
            switch self {
            case .heapIsEmpty:
                return "Heap is Empty"
            }
        }
        
        /**
         A description of the error.
         */
        public var description: String {
            switch self {
            case .heapIsEmpty:
                return "The Binary Heap is empty."
            }
        }
    }
}
