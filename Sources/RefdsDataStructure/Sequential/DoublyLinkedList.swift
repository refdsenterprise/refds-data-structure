import Foundation

/**
 A generic doubly linked list data structure implementation.
 */
public final class DoublyLinkedList<T> {
    private final class Node {
        var value: T
        var previous: Node?
        var next: Node?
        
        init(value: T) {
            self.value = value
        }
    }
    
    private var head: Node?
    private var tail: Node?
    
    /**
     The number of elements in the linked list.
     */
    public var count: Int {
        var node = head
        var count = 0
        
        while node != nil {
            count += 1
            node = node?.next
        }
        
        return count
    }
    
    /**
     Indicates whether the linked list is empty or not.
     */
    public var isEmpty: Bool {
        return head == nil
    }
    
    /**
     Initializes an empty doubly linked list.
     */
    public init() {}
    
    /**
     Initializes the doubly linked list with an array of elements.
     
     - Parameter elements: An array of elements to initialize the linked list.
     */
    public init(elements: [T]) {
        for element in elements {
            append(element)
        }
    }
    
    /**
     Appends an element to the end of the linked list.
     
     - Parameter element: The element to be appended.
     */
    public func append(_ element: T) {
        let newNode = Node(value: element)
        
        if isEmpty {
            head = newNode
            tail = newNode
        } else {
            tail?.next = newNode
            newNode.previous = tail
            tail = newNode
        }
    }
    
    /**
     Inserts an element at the specified index in the linked list.
     
     - Parameters:
        - element: The element to be inserted.
        - index: The index at which to insert the element.
     - Throws: A `DoublyLinkedListError.indexOutOfRange` error if the index is out of range.
     */
    public func insert(_ element: T, at index: Int) throws {
        guard index >= 0 && index <= count else {
            throw DoublyLinkedListError.indexOutOfRange
        }
        
        let newNode = Node(value: element)
        
        if index == 0 {
            newNode.next = head
            head?.previous = newNode
            head = newNode
        } else if index == count {
            tail?.next = newNode
            newNode.previous = tail
            tail = newNode
        } else {
            var node = head
            var currentIndex = 0
            
            while currentIndex < index {
                node = node?.next
                currentIndex += 1
            }
            
            newNode.previous = node?.previous
            newNode.next = node
            node?.previous?.next = newNode
            node?.previous = newNode
        }
    }
    
    /**
     Removes the element at the specified index from the linked list.
     
     - Parameter index: The index of the element to be removed.
     - Throws: A `DoublyLinkedListError.indexOutOfRange` error if the index is out of range.
     */
    public func remove(at index: Int) throws {
        guard index >= 0 && index < count else {
            throw DoublyLinkedListError.indexOutOfRange
        }
        
        if index == 0 {
            head = head?.next
            head?.previous = nil
        } else if index == count - 1 {
            tail = tail?.previous
            tail?.next = nil
        } else {
            var node = head
            var currentIndex = 0
            
            while currentIndex < index {
                node = node?.next
                currentIndex += 1
            }
            
            node?.previous?.next = node?.next
            node?.next?.previous = node?.previous
        }
    }
    
    /**
     Returns the element at the specified index in the linked list.
     
     - Parameter index: The index of the element.
     - Returns: The element at the specified index, or `nil` if the index is out of range.
     */
    public func element(at index: Int) -> T? {
        guard index >= 0 && index < count else {
            return nil
        }
        
        var node = head
        var currentIndex = 0
        
        while currentIndex < index {
            node = node?.next
            currentIndex += 1
        }
        
        return node?.value
    }
    
    /**
     An error type that represents an index out of range in the doubly linked list.
     */
    public enum DoublyLinkedListError: Error {
        /**
         Indicates that the index is out of range.
         */
        case indexOutOfRange
        
        /**
         A title describing the error.
         */
        public var title: String {
            switch self {
            case .indexOutOfRange:
                return "Index Out Of Range"
            }
        }
        
        /**
         A description of the error.
         */
        public var description: String {
            switch self {
            case .indexOutOfRange:
                return "The index is out of range."
            }
        }
    }
}
