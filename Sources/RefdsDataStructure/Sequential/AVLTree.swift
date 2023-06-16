import Foundation

/**
 A generic AVL tree data structure implementation.
 */
public final class AVLTree<T: Comparable> {
    public final class Node {
        public var value: T
        public var left: Node?
        public var right: Node?
        public var height: Int
        
        public init(value: T) {
            self.value = value
            self.height = 1
        }
    }
    
    public var root: Node?
    
    /**
     Initializes an empty AVL tree.
     */
    public init() {}
    
    /**
     Initializes the AVL tree with a root node.
     
     - Parameter value: The value of the root node.
     */
    public init(value: T) {
        self.root = Node(value: value)
    }
    
    /**
     Inserts a value into the AVL tree.
     
     - Parameter value: The value to be inserted.
     */
    public func insert(_ value: T) {
        root = insertValue(value, at: root)
    }
    
    /**
     Inserts a value into the AVL tree recursively.
     
     - Parameters:
        - value: The value to be inserted.
        - node: The node to start the insertion from.
     - Returns: The updated node after insertion.
     */
    private func insertValue(_ value: T, at node: Node?) -> Node {
        guard let node = node else {
            return Node(value: value)
        }
        
        if value < node.value {
            node.left = insertValue(value, at: node.left)
        } else if value > node.value {
            node.right = insertValue(value, at: node.right)
        } else {
            return node
        }
        
        node.height = 1 + max(height(node.left), height(node.right))
        
        let balanceFactor = getBalanceFactor(node)
        
        if balanceFactor > 1 && value < node.left!.value {
            return rotateRight(node)
        }
        
        if balanceFactor < -1 && value > node.right!.value {
            return rotateLeft(node)
        }
        
        if balanceFactor > 1 && value > node.left!.value {
            node.left = rotateLeft(node.left!)
            return rotateRight(node)
        }
        
        if balanceFactor < -1 && value < node.right!.value {
            node.right = rotateRight(node.right!)
            return rotateLeft(node)
        }
        
        return node
    }
    
    /**
     Rotates the subtree rooted at the given node to the right.
     
     - Parameter node: The root node of the subtree to be rotated.
     - Returns: The new root node after rotation.
     */
    public func rotateRight(_ node: Node) -> Node {
        let newRoot = node.left!
        let temp = newRoot.right
        
        newRoot.right = node
        node.left = temp
        
        node.height = 1 + max(height(node.left), height(node.right))
        newRoot.height = 1 + max(height(newRoot.left), height(newRoot.right))
        
        return newRoot
    }
    
    /**
     Rotates the subtree rooted at the given node to the left.
     
     - Parameter node: The root node of the subtree to be rotated.
     - Returns: The new root node after rotation.
     */
    public func rotateLeft(_ node: Node) -> Node {
        let newRoot = node.right!
        let temp = newRoot.left
        
        newRoot.left = node
        node.right = temp


        
        node.height = 1 + max(height(node.left), height(node.right))
        newRoot.height = 1 + max(height(newRoot.left), height(newRoot.right))
        
        return newRoot
    }
    
    /**
     Gets the balance factor of the given node.
     
     - Parameter node: The node to calculate the balance factor.
     - Returns: The balance factor of the node.
     */
    public func getBalanceFactor(_ node: Node?) -> Int {
        return height(node?.left) - height(node?.right)
    }
    
    /**
     Gets the height of the given node.
     
     - Parameter node: The node to calculate the height.
     - Returns: The height of the node.
     */
    public func height(_ node: Node?) -> Int {
        guard let node = node else {
            return 0
        }
        
        return node.height
    }
    
    /**
     An error type that represents an invalid operation on the AVL tree.
     */
    public enum AVLTreeError: Error {
        /**
         Indicates that the operation is not supported on the AVL tree.
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
                return "The operation is not supported on the AVL tree."
            }
        }
    }
}
