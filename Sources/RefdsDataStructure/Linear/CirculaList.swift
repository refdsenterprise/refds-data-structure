import Foundation

/**
 A generic circular list data structure implementation.
 */
public final class CircularList<T: Equatable> {
    private var head: Node<T>?
    
    /**
     A node in the circular list.
     */
    private class Node<T: Equatable> {
        var value: T
        var next: Node<T>?
        
        init(value: T) {
            self.value = value
        }
    }
    
    /**
     Initializes an empty circular list.
     */
    public init() {}
    
    /**
     Appends a new node with the specified value to the end of the circular list.
     
     - Parameter value: The value to be appended to the circular list.
     */
    public func append(value: T) {
        let newNode = Node(value: value)
        
        if head == nil {
            head = newNode
            newNode.next = newNode
        } else {
            let tail = head!.next!
            newNode.next = tail.next
            tail.next = newNode
        }
    }
    
    /**
     Removes the first occurrence of the specified value from the circular list.
     
     - Parameter value: The value to be removed from the circular list.
     - Throws: A `CircularListError.valueNotFound` error if the value is not found in the circular list.
     */
    public func remove(value: T) throws {
        guard head != nil else {
            throw CircularListError.valueNotFound
        }
        
        var prevNode: Node<T>? = nil
        var currentNode: Node<T>? = head
        var found = false
        
        repeat {
            if currentNode!.value == value {
                if prevNode != nil {
                    prevNode!.next = currentNode!.next
                } else {
                    let tail = head!.next!
                    tail.next = currentNode!.next
                    head = currentNode!.next === currentNode ? nil : currentNode!.next
                }
                
                found = true
                break
            }
            
            prevNode = currentNode
            currentNode = currentNode!.next
        } while currentNode !== head
        
        if !found {
            throw CircularListError.valueNotFound
        }
    }
    
    /**
     Returns a Boolean value indicating whether the circular list contains the specified value.
     
     - Parameter value: The value to search for in the circular list.
     - Returns: `true` if the circular list contains the value, `false` otherwise.
     */
    public func contains(value: T) -> Bool {
        if head == nil {
            return false
        }
        
        var currentNode: Node<T>? = head
        
        repeat {
            if currentNode!.value == value {
                return true
            }
            
            currentNode = currentNode!.next
        } while currentNode !== head
        
        return false
    }
    
    /**
     An error type that represents a value not found in the circular list.
     */
    public enum CircularListError: Error {
        /**
         Indicates that the value was not found in the circular list.
         */
        case valueNotFound
        
        /**
         A title describing the error.
         */
        public var title: String {
            switch self {
            case .valueNotFound:
                return "Value Not Found"
            }
        }
        
        /**
         A description of the error.
         */
        public var description: String {
            switch self {
            case .valueNotFound:
                return "The specified value was not found in the circular list."
            }
        }
    }
}
