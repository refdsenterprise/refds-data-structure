import Foundation

/**
 A generic Fenwick Tree (Binary Indexed Tree) data structure implementation.
 */
public final class FenwickTree<T: Numeric> {
    private var tree: [T]
    
    /**
     Initializes a Fenwick Tree with an array of values.
     
     - Parameter values: The array of values to build the Fenwick Tree from.
     */
    public init(_ values: [T]) throws {
        guard !values.isEmpty else {
            throw FenwickTreeError.emptyArray
        }
        
        tree = Array(repeating: T.zero, count: values.count + 1)
        try buildTree(values)
    }
    
    /**
     Builds the Fenwick Tree.
     
     - Parameter values: The array of values to build the Fenwick Tree from.
     */
    private func buildTree(_ values: [T]) throws {
        for (index, value) in values.enumerated() {
            try update(value, at: index)
        }
    }
    
    /**
     Updates the value at a specific index in the Fenwick Tree.
     
     - Parameters:
        - value: The new value.
        - index: The index to update.
     */
    public func update(_ value: T, at index: Int) throws {
        guard index >= 0 && index < tree.count else {
            throw FenwickTreeError.invalidIndex
        }
        
        var currentIndex = index + 1
        while currentIndex < tree.count {
            tree[currentIndex] += value
            currentIndex += (currentIndex & -currentIndex)
        }
    }
    
    /**
     Computes the prefix sum up to a specific index in the Fenwick Tree.
     
     - Parameter index: The index up to which to compute the prefix sum.
     - Returns: The prefix sum up to the given index.
     */
    public func prefixSum(upTo index: Int) throws -> T {
        guard index >= 0 && index < tree.count else {
            throw FenwickTreeError.invalidIndex
        }
        
        var currentIndex = index + 1
        var sum: T = .zero
        while currentIndex > 0 {
            sum += tree[currentIndex]
            currentIndex -= (currentIndex & -currentIndex)
        }
        
        return sum
    }
    
    /**
     An error type that represents an invalid operation on the Fenwick Tree.
     */
    public enum FenwickTreeError: Error {
        /**
         Indicates that the array is empty.
         */
        case emptyArray
        
        /**
         Indicates an invalid index.
         */
        case invalidIndex
        
        /**
         A title describing the error.
         */
        public var title: String {
            switch self {
            case .emptyArray:
                return "Empty Array"
            case .invalidIndex:
                return "Invalid Index"
            }
        }
        
        /**
         A description of the error.
         */
        public var description: String {
            switch self {
            case .emptyArray:
                return "The array is empty."
            case .invalidIndex:
                return "The index is invalid."
            }
        }
    }
}
