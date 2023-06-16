import Foundation

/**
 A generic N-ary Tree data structure implementation.
 */
public final class NaryTree<T: Equatable> {
    private final class Node {
        var value: T
        var children: [Node]
        
        init(value: T) {
            self.value = value
            self.children = []
        }
    }
    
    private let root: Node
    
    /**
     Initializes an N-ary Tree with a root value.
     
     - Parameter value: The value of the root node.
     */
    public init(value: T) {
        self.root = Node(value: value)
    }
    
    /**
     Adds a child node with the specified value to a parent node in the N-ary Tree.
     
     - Parameters:
        - value: The value of the child node to be added.
        - parentValue: The value of the parent node to which the child node will be added.
     - Throws: `NaryTreeError.nodeNotFound` if the parent node is not found in the tree.
     */
    public func addChild(_ value: T, toParentValue parentValue: T) throws {
        guard let parentNode = findNode(withValue: parentValue, node: root) else {
            throw NaryTreeError.nodeNotFound
        }
        
        let childNode = Node(value: value)
        parentNode.children.append(childNode)
    }
    
    /**
     Finds a node with the specified value in the N-ary Tree.
     
     - Parameters:
        - value: The value of the node to find.
        - node: The current node being traversed.
     - Returns: The node with the specified value, or `nil` if not found.
     */
    private func findNode(withValue value: T, node: Node) -> Node? {
        if node.value == value {
            return node
        }
        
        for childNode in node.children {
            if let foundNode = findNode(withValue: value, node: childNode) {
                return foundNode
            }
        }
        
        return nil
    }
    
    /**
     An error type that represents an invalid operation on the N-ary Tree.
     */
    public enum NaryTreeError: Error {
        /**
         Indicates that a node with the specified value was not found in the tree.
         */
        case nodeNotFound
        
        /**
         A title describing the error.
         */
        public var title: String {
            switch self {
            case .nodeNotFound:
                return "Node Not Found"
            }
        }
        
        /**
         A description of the error.
         */
        public var description: String {
            switch self {
            case .nodeNotFound:
                return "A node with the specified value was not found in the tree."
            }
        }
    }
}
