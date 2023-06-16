import Foundation

/**
 A generic Red-Black tree data structure implementation.
 */
public final class RedBlackTree<Key: Comparable, Value> {
    public final class Node {
        public var key: Key
        public var value: Value
        public var left: Node?
        public var right: Node?
        public var parent: Node?
        public var color: Color
        
        public enum Color {
            case red
            case black
        }
        
        /**
         Initializes a node with the specified key, value, and color.
         
         - Parameters:
            - key: The key of the node.
            - value: The value associated with the key.
            - color: The color of the node.
         */
        public init(key: Key, value: Value, color: Color) {
            self.key = key
            self.value = value
            self.color = color
        }
    }
    
    public var root: Node?
    
    /**
     Initializes an empty Red-Black tree.
     */
    public init() {}
    
    /**
     Inserts a key-value pair into the Red-Black tree.
     
     - Parameters:
        - key: The key to be inserted.
        - value: The value associated with the key.
     */
    public func insert(_ key: Key, value: Value) {
        let newNode = Node(key: key, value: value, color: .red)
        
        if root == nil {
            root = newNode
            root?.color = .black
        } else {
            insertNode(newNode, at: root)
            fixViolationAfterInsertion(newNode)
        }
    }
    
    /**
     Inserts a node into the Red-Black tree recursively.
     
     - Parameters:
        - node: The node to be inserted.
        - parent: The parent node to start the insertion from.
     */
    public func insertNode(_ node: Node, at parent: Node?) {
        guard let parent = parent else { return }
        if node.key < parent.key {
            if parent.left == nil {
                parent.left = node
                node.parent = parent
            } else {
                insertNode(node, at: parent.left)
            }
        } else if node.key > parent.key {
            if parent.right == nil {
                parent.right = node
                node.parent = parent
            } else {
                insertNode(node, at: parent.right)
            }
        }
    }
    
    /**
     Fixes the violation in the Red-Black tree after node insertion.
     
     - Parameter node: The node to fix the violation for.
     */
    public func fixViolationAfterInsertion(_ node: Node) {
        var currentNode = node
        
        while currentNode !== root && currentNode.parent?.color == .red {
            let parent = currentNode.parent!
            let grandparent = parent.parent!
            
            if parent === grandparent.left {
                let uncle = grandparent.right
                
                if uncle?.color == .red {
                    parent.color = .black
                    uncle?.color = .black
                    grandparent.color = .red
                    currentNode = grandparent
                } else {
                    if currentNode === parent.right {
                        rotateLeft(parent)
                        currentNode = parent
                    }
                    
                    parent.color = .black
                    grandparent.color = .red
                    rotateRight(grandparent)
                }
            } else {
                let uncle = grandparent.left
                
                if uncle?.color == .red {
                    parent.color = .black
                    uncle?.color = .black
                    grandparent.color = .red
                    currentNode = grandparent
                } else {
                    if currentNode === parent.left {
                        rotateRight(parent)
                        currentNode = parent
                    }
                    
                    parent.color = .black
                    grandparent.color = .red
                    rotateLeft(grandparent)
                }
            }
        }
        
        root?.color = .black
    }
    
    /**
     Rotates the subtree rooted at the given node to the left.
     
     - Parameter node: The root node of the subtree to be rotated.
     */
    public func rotateLeft(_ node: Node) {
        let newRoot = node.right!
        node.right = newRoot.left
        
        if newRoot.left != nil {
            newRoot.left?.parent = node
        }
        
        newRoot.parent = node.parent
        
        if node === root {
            root = newRoot
        } else if node === node.parent?.left {
            node.parent?.left = newRoot
        } else {
            node.parent?.right = newRoot
        }
        
        newRoot.left = node
        node.parent = newRoot
    }
    
    /**
     Rotates the subtree rooted at the given node to the right.
     
     - Parameter node: The root node of the subtree to be rotated.
     */
    public func rotateRight(_ node: Node) {
        let newRoot = node.left!
        node.left = newRoot.right
        
        if newRoot.right != nil {
            newRoot.right?.parent = node
        }
        
        newRoot.parent = node.parent
        
        if node === root {
            root = newRoot
        } else if node === node.parent?.left {
            node.parent?.left = newRoot
        } else {
            node.parent?.right = newRoot
        }
        
        newRoot.right = node
        node.parent = newRoot
    }
}
