import Foundation

/**
 A generic linked list implementation.
 
 It allows adding, removing, and searching for values in the linked list.
 */
public final class LinkedList<T: Equatable> {
    /**
     A generic node used in a linked list.
     
     It holds a value of a generic type and has references to the previous and next nodes in the list.
     */
    private class Node<T: Equatable> {
        /// The value held by the node.
        var value: T
        
        /// The previous node in the linked list.
        weak var previous: Node?
        
        /// The next node in the linked list.
        var next: Node?
        
        /**
         Initializes a new instance of `Node` with the specified value.
         
         - Parameter value: The value to be held by the node.
         */
        init(value: T) {
            self.value = value
        }
    }
    
    /// The head (first node) of the linked list.
    private var head: Node<T>?
    
    /// The tail (last node) of the linked list.
    private var tail: Node<T>?
    
    /// Returns a Boolean value indicating whether the linked list is empty.
    public var isEmpty: Bool {
        return head == nil
    }
    
    /// Returns the first node in the linked list.
    public var first: T? {
        return head?.value
    }
    
    /// Returns the last node in the linked list.
    public var last: T? {
        return tail?.value
    }
    
    /**
     Initializes an empty linked list.
     */
    public init() {}
    
    /**
     Appends a new node with the specified value to the end of the linked list.
     
     - Parameter value: The value to be appended to the linked list.
     */
    public func append(value: T) {
        let newNode = Node(value: value)
        
        if let tailNode = tail {
            newNode.previous = tailNode
            tailNode.next = newNode
        } else {
            head = newNode
        }
        
        tail = newNode
    }
    
    /**
     Returns the node at the specified index in the linked list.
     
     - Parameter index: The index of the node to retrieve.
     - Returns: The node at the specified index, or `nil` if the index is out of range.
     */
    private func nodeAt(index: Int) -> Node<T>? {
        if index >= 0 {
            var node = head
            var i = index
            
            while node != nil {
                if i == 0 {
                    return node
                }
                
                node = node!.next
                i -= 1
            }
        }
        
        return nil
    }
    
    /**
     Inserts a new node with the specified value at the given index in the linked list.
     
     - Parameter value: The value to be inserted into the linked list.
     - Parameter index: The index at which to insert the value.
     */
    public func insert(value: T, atIndex index: Int) {
        if index == 0 {
            let newNode = Node(value: value)
            newNode.next = head
            head?.previous = newNode
            head = newNode
            
            if tail == nil {
                tail = head
            }
            
            return
        }
        
        let prevNode = nodeAt(index: index - 1)
        let nextNode = prevNode?.next
        
        let newNode = Node(value: value)
        newNode.previous = prevNode
        newNode.next = nextNode
        prevNode?.next = newNode
        nextNode?.previous = newNode
        
        if nextNode == nil {
            tail = newNode
        }
    }
    
    /**
     Removes the node at the specified index from the linked list.
     
     - Parameter index: The index of the node to be removed.
     */
    public func remove(atIndex index: Int) {
        guard let nodeToRemove = nodeAt(index: index) else {
            return
        }
        
        let prevNode = nodeToRemove.previous
        let nextNode = nodeToRemove.next
        
        prevNode?.next = nextNode
        nextNode?.previous = prevNode
        
        if nodeToRemove === head {
            head = nextNode
        }
        
        if nodeToRemove === tail {
            tail = prevNode
        }
        
        nodeToRemove.previous = nil
        nodeToRemove.next = nil
    }
    
    /**
     Returns a Boolean value indicating whether the linked list contains the specified value.
     
     - Parameter value: The value to search for in the linked list.
     - Returns: `true` if the linked list contains the value, `false` otherwise.
     - Throws: A `LinkedListError.valueNotFound` error if the value is not found in the linked list.
     */
    public func contains(value: T) throws -> Bool {
        var currentNode = head
        
        while currentNode != nil {
            if currentNode!.value == value {
                return true
            }
            
            currentNode = currentNode!.next
        }
        
        throw LinkedListError.valueNotFound
    }
    
    /**
     Returns the index of the first occurrence of the specified value in the linked list.
     
     - Parameter value: The value to search for in the linked list.
     - Returns: The index of the value if found, or `nil` if the value is not found.
     - Throws: A `LinkedListError.valueNotFound` error if the value is not found in the linked list.
     */
    public func index(of value: T) throws -> Int {
        var currentNode = head
        var index = 0
        
        while currentNode != nil {
            if currentNode!.value == value {
                return index
            }
            
            currentNode = currentNode!.next
            index += 1
        }
        
        throw LinkedListError.valueNotFound
    }
    
    /**
     Error types that can be thrown by the LinkedList class.
     */
    public enum LinkedListError: Error {
        /**
         Indicates that a value was not found in the linked list.
         */
        case valueNotFound
        
        /**
         A title describing the error.
         
         - Returns: A string representing the title of the error.
         */
        public var title: String {
            switch self {
            case .valueNotFound:
                return "Value Not Found"
            }
        }
        
        /**
         A description of the error.
         
         - Returns: A string representing the description of the error.
         */
        public var description: String {
            switch self {
            case .valueNotFound:
                return "The specified value was not found in the linked list."
            }
        }
    }
}
