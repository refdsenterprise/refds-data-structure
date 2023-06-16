import Foundation

public final class KDTree<T: Comparable & Hashable> {
    private final class Node {
        var value: T
        var left: Node?
        var right: Node?
        var dimensions: [T]
        
        init(value: T, dimensions: [T]) {
            self.value = value
            self.left = nil
            self.right = nil
            self.dimensions = dimensions
        }
    }
    
    private var root: Node?
    private let k: Int // Number of dimensions
    
    /**
     Initializes an empty KD Tree with the specified number of dimensions.
     
     - Parameter dimensions: The number of dimensions.
     */
    public init(dimensions: Int) {
        self.root = nil
        self.k = dimensions
    }
    
    /**
     Inserts a value into the KD Tree.
     
     - Parameter value: The value to be inserted.
     */
    public func insert(_ value: T) {
        root = insertValue(value, dimensions: Array(repeating: value, count: k), node: root)
    }
    
    /**
     Inserts a value recursively into the KD Tree.
     
     - Parameters:
        - value: The value to be inserted.
        - dimensions: The current dimensions (values for each dimension).
        - node: The current node in the KD Tree.
     - Returns: The updated node.
     */
    private func insertValue(_ value: T, dimensions: [T], node: Node?) -> Node {
        guard let currentNode = node else {
            return Node(value: value, dimensions: dimensions)
        }
        
        let dimensionToCompare = dimensions.count % k
        let compareResult = compareValue(value, with: currentNode.value, at: dimensionToCompare)
        
        if compareResult < 0 {
            currentNode.left = insertValue(value, dimensions: dimensions, node: currentNode.left)
        } else {
            currentNode.right = insertValue(value, dimensions: dimensions, node: currentNode.right)
        }
        
        return currentNode
    }
    
    /**
     Compares two values at a specific dimension.
     
     - Parameters:
        - value1: The first value.
        - value2: The second value.
        - dimension: The dimension to compare.
     - Returns: A negative value if `value1` is less than `value2`, a positive value if `value1` is greater than `value2`, or 0 if they are equal.
     */
    private func compareValue(_ value1: T, with value2: T, at dimension: Int) -> Int {
        // Compare the values based on the current dimension
        // Example: For a 2D point, compare the x-coordinate if dimension is 0, and y-coordinate if dimension is 1
        
        // Implement your own comparison logic based on your data structure
        // This is just a simple example assuming T is a comparable type
        
        if dimension == 0 {
            return value1 < value2 ? -1 : (value1 > value2 ? 1 : 0)
        } else {
            return value1 < value2 ? -1 : (value1 > value2 ? 1 : 0)
        }
    }
    
    /**
     Searches for a value in the KD Tree.
     
     - Parameter value: The value to search for.
     - Returns: `true` if the value is found, `false` otherwise.
     */
    public func search(_ value: T) -> Bool {
        return searchValue(value, dimensions: Array(repeating: value, count: k), node: root)
    }
    
    /**
     Searches for a value recursively in the KD Tree.
     
     - Parameters:
        - value: The value to search for.
        - dimensions: The current dimensions (values for each dimension).
        - node: The current node in the KD Tree.
     - Returns: `true` if the value is found, `false` otherwise.
     */
    private func searchValue(_ value: T, dimensions: [T], node: Node?) -> Bool {
        guard let currentNode = node else {
            return false
        }
        
        let dimensionToCompare = dimensions.count % k
        let compareResult = compareValue(value, with: currentNode.value, at: dimensionToCompare)
        
        if compareResult == 0 {
            return true
        } else if compareResult < 0 {
            return searchValue(value, dimensions: dimensions, node: currentNode.left)
        } else {
            return searchValue(value, dimensions: dimensions, node: currentNode.right)
        }
    }
    
    /**
     Removes a value from the KD Tree.
     
     - Parameter value: The value to be removed.
     - Throws: `KDTreeError.valueNotFound` if the value does not exist in the tree.
     */
    public func remove(_ value: T) throws {
        guard let rootNode = root else {
            throw KDTreeError.valueNotFound
        }
        
        root = removeValue(value, dimensions: Array(repeating: value, count: k), node: rootNode)
    }
    
    /**
     Removes a value recursively from the KD Tree.
     
     - Parameters:
        - value: The value to be removed.
        - dimensions: The current dimensions (values for each dimension).
        - node: The current node in the KD Tree.
     - Returns: The updated node.
     */
    private func removeValue(_ value: T, dimensions: [T], node: Node?) -> Node? {
        guard let currentNode = node else {
            return nil
        }
        
        let dimensionToCompare = dimensions.count % k
        let compareResult = compareValue(value, with: currentNode.value, at: dimensionToCompare)
        
        if compareResult == 0 {
            if currentNode.right != nil {
                let successor = findMinimum(currentNode.right!)
                currentNode.value = successor.value
                currentNode.right = removeValue(successor.value, dimensions: successor.dimensions, node: currentNode.right)
            } else if currentNode.left != nil {
                return currentNode.left
            } else {
                return nil
            }
        } else if compareResult < 0 {
            currentNode.left = removeValue(value, dimensions: dimensions, node: currentNode.left)
        } else {
            currentNode.right = removeValue(value, dimensions: dimensions, node: currentNode.right)
        }
        
        return currentNode
    }
    
    /**
     Finds the minimum value in a KD Tree.
     
     - Parameter node: The root node of the tree.
     - Returns: The node with the minimum value.
     */
    private func findMinimum(_ node: Node) -> Node {
        var current = node
        while current.left != nil {
            current = current.left!
        }
        return current
    }
    
    // Other operations and utility methods...
    
    /**
     An error type that represents an invalid operation on the KD Tree.
     */
    public enum KDTreeError: Error {
        /**
         Indicates that the value was not found in the tree.
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
                return "The value was not found in the KD Tree."
            }
        }
    }
}
