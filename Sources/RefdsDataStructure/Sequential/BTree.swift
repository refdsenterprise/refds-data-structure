import Foundation

/**
 A generic B-Tree data structure implementation.
 */
public final class BTree<Key: Comparable, Value> {
    public final class Node {
        public var keys: [Key] = []
        public var children: [Node] = []
        public var isLeaf: Bool = true
        public var parent: Node?
        
        public init() {}
    }
    
    public var root: Node?
    public let order: Int
    
    /**
     Initializes a B-Tree with the specified order.
     
     - Parameter order: The order of the B-Tree.
     */
    public init(order: Int) {
        precondition(order >= 2, "Order must be greater than or equal to 2.")
        self.order = order
    }
    
    /**
     Inserts a key-value pair into the B-Tree.
     
     - Parameters:
        - key: The key to be inserted.
        - value: The value associated with the key.
     */
    public func insert(_ key: Key, value: Value) {
        if let root = root {
            if root.keys.count == (order * 2 - 1) {
                let newRoot = Node()
                newRoot.children.append(root)
                splitChild(root, at: 0, parent: newRoot)
                self.root = newRoot
                insertNonFull(newRoot, key: key, value: value)
            } else {
                insertNonFull(root, key: key, value: value)
            }
        } else {
            root = Node()
            root?.keys.append(key)
        }
    }
    
    /**
     Inserts a key-value pair into a non-full node of the B-Tree recursively.
     
     - Parameters:
        - node: The node to insert the key-value pair into.
        - key: The key to be inserted.
        - value: The value associated with the key.
     */
    public func insertNonFull(_ node: Node, key: Key, value: Value) {
        var index = node.keys.count - 1
        
        if node.isLeaf {
            while index >= 0 && key < node.keys[index] {
                index -= 1
            }
            node.keys.insert(key, at: index + 1)
            // You can associate the value with the key here
        } else {
            while index >= 0 && key < node.keys[index] {
                index -= 1
            }
            index += 1
            
            if node.children[index].keys.count == (order * 2 - 1) {
                splitChild(node.children[index], at: index, parent: node)
                if key > node.keys[index] {
                    index += 1
                }
            }
            
            insertNonFull(node.children[index], key: key, value: value)
        }
    }
    
    /**
     Splits a full child node during insertion.
     
     - Parameters:
        - child: The full child node to be split.
        - index: The index of the child node in the parent node.
        - parent: The parent node of the child node.
     */
    public func splitChild(_ child: Node, at index: Int, parent: Node) {
        let newChild = Node()
        let middleIndex = order - 1
        
        parent.keys.insert(child.keys[middleIndex], at: index)
        parent.children.insert(newChild, at: index + 1)
        
        newChild.keys = Array(child.keys.suffix(from: order))
        child.keys.removeSubrange(middleIndex..<child.keys.count)
        
        if !child.isLeaf {
            newChild.isLeaf = false
            newChild.children = Array(child.children.suffix(from: order))
            child.children.removeSubrange(middleIndex + 1..<child.children.count)
            newChild.children.forEach { $0.parent = newChild }
        }
        
        child.keys.removeLast()
        parent.children[index] = child
        parent.children[index + 1] = newChild
    }
    
    /**
     An error type that represents an invalid operation on the B-Tree.
     */
    public enum BTreeError: Error {
        /**
         Indicates that the operation is not supported on the B-Tree.
         */
        case invalidOperation
        
        /**
         A title describing the error.
         */
        public var title: String {
            switch self {
            case .invalidOperation:
                return "Invalid Operation"
            }
        }
        
        /**
         A description of the error.
         */
        public var description: String {
            switch self {
            case .invalidOperation:
                return "The operation is not supported on the B-Tree."
            }
        }
    }
}
