import Foundation

/**
 A generic binary tree data structure implementation.
 */
public final class BinaryTree<T: Comparable> {
    public final class Node {
        public var value: T
        public var left: Node?
        public var right: Node?
        
        public init(value: T) {
            self.value = value
        }
    }
    
    public var root: Node?
    
    /**
     Initializes an empty binary tree.
     */
    public init() {}
    
    /**
     Initializes the binary tree with a root node.
     
     - Parameter value: The value of the root node.
     */
    public init(value: T) {
        self.root = Node(value: value)
    }
    
    /**
     Inserts a value into the binary tree.
     
     - Parameter value: The value to be inserted.
     */
    public func insert(_ value: T) {
        let newNode = Node(value: value)
        
        if root == nil {
            root = newNode
        } else {
            insertNode(newNode, at: root)
        }
    }
    
    /**
     Inserts a node into the binary tree recursively.
     
     - Parameters:
        - node: The node to be inserted.
        - parent: The parent node to start the insertion from.
     */
    private func insertNode(_ node: Node, at parent: Node?) {
        if node.value < parent!.value {
            if parent!.left == nil {
                parent!.left = node
            } else {
                insertNode(node, at: parent!.left)
            }
        } else if node.value > parent!.value {
            if parent!.right == nil {
                parent!.right = node
            } else {
                insertNode(node, at: parent!.right)
            }
        }
    }
    
    /**
     Checks if the binary tree contains a value.
     
     - Parameter value: The value to be checked.
     - Returns: `true` if the value is found, otherwise `false`.
     */
    public func contains(_ value: T) -> Bool {
        return containsValue(value, at: root)
    }
    
    /**
     Checks if a value exists in the binary tree recursively.
     
     - Parameters:
        - value: The value to be checked.
        - node: The node to start the search from.
     - Returns: `true` if the value is found, otherwise `false`.
     */
    private func containsValue(_ value: T, at node: Node?) -> Bool {
        guard let node = node else {
            return false
        }
        
        if value == node.value {
            return true
        } else if value < node.value {
            return containsValue(value, at: node.left)
        } else {
            return containsValue(value, at: node.right)
        }
    }
    
    /**
     Traverses the binary tree in pre-order and returns the elements.
     
     - Returns: An array of elements in pre-order traversal.
     */
    public func preOrderTraversal() -> [T] {
        var elements: [T] = []
        preOrderTraverse(root, result: &elements)
        return elements
    }
    
    /**
     Performs pre-order traversal recursively and adds the elements to the result array.
     
     - Parameters:
        - node: The current node in the traversal.
        - result: The array to store the elements.
     */
    private func preOrderTraverse(_ node: Node?, result: inout [T]) {
        guard let node = node else {
            return
        }
        
        result.append(node.value)
        preOrderTraverse(node.left, result: &result)
        preOrderTraverse(node.right, result: &result)
    }
    
    /**
     Traverses the binary tree in in-order and returns the elements.
     
     - Returns: An array of elements in in-order traversal.
     */
    public func inOrderTraversal() -> [T] {
        var elements: [T] = []
        inOrderTraverse(root, result: &elements)
        return elements
    }
    
    /**
     Performs in-order traversal recursively and adds the elements to the result array.
     
     - Parameters:
        - node: The current node in the traversal.
        - result: The array to store the elements.
     */
    private func inOrderTraverse(_ node: Node?, result: inout [T]) {
        guard let node = node else {
            return
        }
        
        inOrderTraverse(node.left, result: &result)
        result.append(node.value)
        inOrderTraverse(node.right, result: &result)
    }
    
    /**
     Traverses the binary tree in post-order and returns the elements.
     
     - Returns: An array of elements in post-order traversal.
     */
    public func postOrderTraversal() -> [T] {
        var elements: [T] = []
        postOrderTraverse(root, result: &elements)
        return elements
    }
    
    /**
     Performs post-order traversal recursively and adds the elements to the result array.
     
     - Parameters:
        - node: The current node in the traversal.
        - result: The array to store the elements.
     */
    private func postOrderTraverse(_ node: Node?, result: inout [T]) {
        guard let node = node else {
            return
        }
        
        postOrderTraverse(node.left, result: &result)
        postOrderTraverse(node.right, result: &result)
        result.append(node.value)
    }
    
    /**
     An error type that represents an invalid operation on the binary tree.
     */
    public enum BinaryTreeError: Error {
        /**
         Indicates that the operation is not supported on the binary tree.
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
                return "The operation is not supported on the binary tree."
            }
        }
    }
}
