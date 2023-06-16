import Foundation

public final class Heap<T: Comparable> {
    private var elements: [T] = []

    /**
     Initializes an empty heap.
     */
    public init() {}

    /**
     Initializes the heap with an array of elements.
     
     - Parameter elements: An array of elements to initialize the heap.
     - Throws: A `HeapError.invalidHeap` error if the elements array does not form a valid heap.
     */
    public init(elements: [T]) throws {
        self.elements = elements
        try buildHeap()
    }

    /**
     The number of elements in the heap.
     */
    public var count: Int {
        return elements.count
    }

    /**
     Indicates whether the heap is empty or not.
     */
    public var isEmpty: Bool {
        return elements.isEmpty
    }

    /**
     Inserts an element into the heap.
     
     - Parameter element: The element to be inserted.
     */
    public func insert(_ element: T) {
        elements.append(element)
        siftUp(from: elements.count - 1)
    }

    /**
     Removes and returns the minimum element from the heap.
     
     - Returns: The minimum element from the heap, or `nil` if the heap is empty.
     */
    public func extractMin() throws -> T? {
        guard !isEmpty else {
            return nil
        }

        let minElement = elements[0]
        elements[0] = elements[elements.count - 1]
        elements.removeLast()

        if !isEmpty {
            try siftDown(from: 0)
        }

        return minElement
    }

    /**
     Returns the minimum element from the heap without removing it.
     
     - Returns: The minimum element from the heap, or `nil` if the heap is empty.
     */
    public func peek() -> T? {
        return elements.first
    }

    /**
     Builds the heap from the current elements array.
     
     - Throws: A `HeapError.invalidHeap` error if the elements array does not form a valid heap.
     */
    private func buildHeap() throws {
        guard !isEmpty else {
            return
        }

        let startIndex = parentIndex(of: elements.count - 1)

        for index in stride(from: startIndex, through: 0, by: -1) {
            try siftDown(from: index)
        }
    }

    /**
     Performs the sift-up operation starting from the given index.
     
     - Parameter index: The index to start the sift-up operation from.
     */
    private func siftUp(from index: Int) {
        var childIndex = index
        var parentIndex = self.parentIndex(of: childIndex)

        while childIndex > 0 && elements[childIndex] < elements[parentIndex] {
            elements.swapAt(childIndex, parentIndex)
            childIndex = parentIndex
            parentIndex = self.parentIndex(of: childIndex)
        }
    }

    /**
     Performs the sift-down operation starting from the given index.
     
     - Parameter index: The index to start the sift-down operation from.
     - Throws: A `HeapError.invalidHeap` error if the elements array does not form a valid heap.
     */
    private func siftDown(from index: Int) throws {
        let startIndex = index
        let endIndex = elements.count
        let value = elements[index]

        var rootIndex = startIndex

        while true {
            let leftChildIndex = self.leftChildIndex(of: rootIndex)
            let rightChildIndex = self.rightChildIndex(of: rootIndex)
            var swapIndex = rootIndex

            if leftChildIndex < endIndex && elements[leftChildIndex] < elements[swapIndex] {
                swapIndex = leftChildIndex
            }

            if rightChildIndex < endIndex && elements[rightChildIndex] < elements[swapIndex] {
                swapIndex = rightChildIndex
            }

            if swapIndex == rootIndex {
                break
            }

            elements[rootIndex] = elements[swapIndex]
            rootIndex = swapIndex
        }

        elements[rootIndex] = value
    }

    /**
     Returns the index of the parent node of the node at the given index.
     
     - Parameter index: The index of the node.
     - Returns: The index of the parent node.
     */
    private func parentIndex(of index: Int) -> Int {
        return (index - 1) / 2
    }

    /**
     Returns the index of the left child node of the node at the given index.
     
     - Parameter index: The index of the node.
     - Returns: The index of the left child node.
     */
    private func leftChildIndex(of index: Int) -> Int {
        return (2 * index) + 1
    }

    /**
     Returns the index of the right child node of the node at the given index.
     
     - Parameter index: The index of the node.
     - Returns: The index of the right child node.
     */
    private func rightChildIndex(of index: Int) -> Int {
        return (2 * index) + 2
    }

    /**
     An error type that represents an invalid heap.
     */
    public enum HeapError: Error {
        /**
         Indicates that the heap is invalid.
         */
        case invalidHeap

        /**
         A title describing the error.
         */
        public var title: String {
            switch self {
            case .invalidHeap:
                return "Invalid Heap"
            }
        }

        /**
         A description of the error.
         */
        public var description: String {
            switch self {
            case .invalidHeap:
                return "The elements array does not form a valid heap."
            }
        }
    }
}
