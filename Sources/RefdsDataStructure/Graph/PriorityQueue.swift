import Foundation

/**
 A class representing a Priority Queue data structure.
 */
public final class PriorityQueue<T: Comparable> {
    private var heap: BinaryHeap<T>
    
    /**
     Initializes an empty Priority Queue.
     */
    public init() {
        heap = BinaryHeap<T>()
    }
    
    /**
     Initializes the Priority Queue with an array of elements.
     
     - Parameter elements: The elements to be added to the queue.
     */
    public init(elements: [T]) {
        heap = BinaryHeap<T>(elements: elements)
    }
    
    /**
     Adds an element to the Priority Queue.
     
     - Parameter element: The element to be added.
     */
    public func enqueue(_ element: T) {
        heap.insert(element)
    }
    
    /**
     Removes and returns the highest-priority element from the Priority Queue.
     
     - Returns: The highest-priority element, or `nil` if the queue is empty.
     */
    public func dequeue() -> T? {
        return heap.extractMin()
    }
    
    /**
     Checks if the Priority Queue is empty.
     */
    public var isEmpty: Bool {
        return heap.isEmpty
    }
    
    /**
     A custom error type that represents an invalid operation on the Priority Queue.
     */
    public enum PriorityQueueError: Error {
        /**
         Indicates that the queue is empty.
         */
        case queueIsEmpty
        
        /**
         A title describing the error.
         */
        public var title: String {
            switch self {
            case .queueIsEmpty:
                return "Queue is Empty"
            }
        }
        
        /**
         A description of the error.
         */
        public var description: String {
            switch self {
            case .queueIsEmpty:
                return "The Priority Queue is empty."
            }
        }
    }
}
