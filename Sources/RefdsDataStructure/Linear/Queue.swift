import Foundation

/**
 A generic queue data structure implementation.
 */
public final class Queue<T: Equatable> {
    private var elements: [T] = []
    
    /**
     Initializes an empty queue.
     */
    public init() {}
    
    /**
     The number of elements in the queue.
     */
    public var count: Int {
        return elements.count
    }
    
    /**
     Indicates whether the queue is empty or not.
     */
    public var isEmpty: Bool {
        return elements.isEmpty
    }
    
    /**
     Enqueues an element at the end of the queue.
     
     - Parameter element: The element to be enqueued.
     */
    public func enqueue(_ element: T) {
        elements.append(element)
    }
    
    /**
     Dequeues the element at the front of the queue and returns it.
     
     - Returns: The element at the front of the queue.
     - Throws: A `QueueError.queueIsEmpty` error if the queue is empty.
     */
    public func dequeue() throws -> T {
        guard !isEmpty else {
            throw QueueError.queueIsEmpty
        }
        
        return elements.removeFirst()
    }
    
    /**
     Returns the element at the front of the queue without removing it.
     
     - Returns: The element at the front of the queue.
     - Throws: A `QueueError.queueIsEmpty` error if the queue is empty.
     */
    public func peek() throws -> T {
        guard let firstElement = elements.first else {
            throw QueueError.queueIsEmpty
        }
        
        return firstElement
    }
    
    /**
     An error type that represents an empty queue.
     */
    public enum QueueError: Error {
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
                return "Queue Is Empty"
            }
        }
        
        /**
         A description of the error.
         */
        public var description: String {
            switch self {
            case .queueIsEmpty:
                return "The queue is currently empty."
            }
        }
    }
}
