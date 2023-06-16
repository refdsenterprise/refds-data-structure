import Foundation

/**
 A generic stack data structure implementation.
 */
public final class Stack<T: Equatable> {
    private var elements: [T] = []
    
    /**
     Initializes an empty stack.
     */
    public init() {}
    
    /**
     The number of elements in the stack.
     */
    public var count: Int {
        return elements.count
    }
    
    /**
     Indicates whether the stack is empty or not.
     */
    public var isEmpty: Bool {
        return elements.isEmpty
    }
    
    /**
     Pushes an element onto the top of the stack.
     
     - Parameter element: The element to be pushed onto the stack.
     */
    public func push(_ element: T) {
        elements.append(element)
    }
    
    /**
     Pops the top element from the stack and returns it.
     
     - Returns: The top element of the stack, or `nil` if the stack is empty.
     */
    public func pop() -> T? {
        return elements.popLast()
    }
    
    /**
     Returns the top element of the stack without removing it.
     
     - Returns: The top element of the stack, or `nil` if the stack is empty.
     */
    public func peek() -> T? {
        return elements.last
    }
    
    /**
     Searches for an element in the stack and returns its position (zero-based index).
     
     - Parameter element: The element to search for in the stack.
     - Returns: The position (zero-based index) of the element in the stack, or `nil` if the element is not found.
     - Throws: A `StackError.elementNotFound` error if the element is not found in the stack.
     */
    public func search(_ element: T) throws -> Int? {
        if let index = elements.lastIndex(of: element) {
            return index
        }
        
        throw StackError.elementNotFound
    }
    
    /**
     An error type that represents an element not found in the stack.
     */
    public enum StackError: Error {
        /**
         Indicates that the element was not found in the stack.
         */
        case elementNotFound
        
        /**
         A title describing the error.
         */
        public var title: String {
            switch self {
            case .elementNotFound:
                return "Element Not Found"
            }
        }
        
        /**
         A description of the error.
         */
        public var description: String {
            switch self {
            case .elementNotFound:
                return "The specified element was not found in the stack."
            }
        }
    }
}
