import Foundation
/**
 A generic Segment Tree data structure implementation.
 */
public final class SegmentTree<T> {
    public var tree: [T]
    public let defaultValue: T
    public let merge: (T, T) -> T
    
    /**
     Initializes a Segment Tree with an array of values.
     
     - Parameters:
        - values: The array of values to build the Segment Tree from.
        - defaultValue: The default value used for query ranges that are not fully contained in any segment.
        - merge: The closure used to merge two values in the tree.
     */
    public init(_ values: [T], defaultValue: T, merge: @escaping (T, T) -> T) throws {
        guard !values.isEmpty else {
            throw SegmentTreeError.emptyArray
        }
        
        self.defaultValue = defaultValue
        self.merge = merge
        tree = Array(repeating: defaultValue, count: values.count * 4)
        try buildTree(values, 0, 0, values.count - 1)
    }
    
    /**
     Builds the Segment Tree recursively.
     
     - Parameters:
        - values: The array of values to build the Segment Tree from.
        - index: The current index in the tree.
        - left: The left index of the range.
        - right: The right index of the range.
     */
    public func buildTree(_ values: [T], _ index: Int, _ left: Int, _ right: Int) throws {
        if left == right {
            tree[index] = values[left]
        } else {
            let mid = (left + right) / 2
            let leftChildIndex = 2 * index + 1
            let rightChildIndex = 2 * index + 2
            
            try buildTree(values, leftChildIndex, left, mid)
            try buildTree(values, rightChildIndex, mid + 1, right)
            
            tree[index] = merge(tree[leftChildIndex], tree[rightChildIndex])
        }
    }
    
    /**
     Updates the value at a specific index in the Segment Tree.
     
     - Parameters:
        - value: The new value.
        - index: The index to update.
     */
    public func update(_ value: T, at index: Int) throws {
        guard index >= 0 && index < tree.count / 4 else {
            throw SegmentTreeError.invalidIndex
        }
        
        try updateValue(value, 0, 0, tree.count / 4 - 1, index)
    }
    
    /**
     Updates the value recursively in the Segment Tree.
     
     - Parameters:
        - value: The new value.
        - treeIndex: The current index in the tree.
        - left: The left index of the range.
        - right: The right index of the range.
        - index: The index to update.
     */
    public func updateValue(_ value: T, _ treeIndex: Int, _ left: Int, _ right: Int, _ index: Int) throws {
        if left == right {
            tree[treeIndex] = value
        } else {
            let mid = (left + right) / 2
            let leftChildIndex = 2 * treeIndex + 1
            let rightChildIndex = 2 * treeIndex + 2
            
            if index <= mid {
                try updateValue(value, leftChildIndex, left, mid, index)
            } else {
                try updateValue(value, rightChildIndex, mid + 1, right, index)
            }
            
            tree[treeIndex] = merge(tree[leftChildIndex], tree[rightChildIndex])
        }
    }
    
    /**
     Queries a range in the Segment Tree and returns the result.
     
     - Parameters:
        - rangeLeft: The left index of the query range.
        - rangeRight: The right index of the query range.
     - Returns: The result of the query.
     */
    public func query(rangeLeft: Int, rangeRight: Int) throws -> T {
        guard rangeLeft >= 0 && rangeRight >= rangeLeft && rangeRight < tree.count / 4 else {
            throw SegmentTreeError.invalidRange
        }
        
        return try queryValue(0, 0, tree.count / 4 - 1, rangeLeft, rangeRight)
    }
    
    /**
     Queries a range recursively in the Segment Tree and returns the result.
     
     - Parameters:
        - treeIndex: The current index in the tree.
        - left: The left index of the range.
        - right: The right index of the range.
        - rangeLeft: The left index of the query range.
        - rangeRight: The right index of the query range.
     - Returns: The result of the query.
     */
    public func queryValue(_ treeIndex: Int, _ left: Int, _ right: Int, _ rangeLeft: Int, _ rangeRight: Int) throws -> T {
        if left == rangeLeft && right == rangeRight {
            return tree[treeIndex]
        }
        
        let mid = (left + right) / 2
        let leftChildIndex = 2 * treeIndex + 1
        let rightChildIndex = 2 * treeIndex + 2
        
        if rangeRight <= mid {
            return try queryValue(leftChildIndex, left, mid, rangeLeft, rangeRight)
        } else if rangeLeft > mid {
            return try queryValue(rightChildIndex, mid + 1, right, rangeLeft, rangeRight)
        } else {
            let leftResult = try queryValue(leftChildIndex, left, mid, rangeLeft, mid)
            let rightResult = try queryValue(rightChildIndex, mid + 1, right, mid + 1, rangeRight)
            return merge(leftResult, rightResult)
        }
    }
    
    /**
     An error type that represents an invalid operation on the Segment Tree.
     */
    public enum SegmentTreeError: Error {
        /**
         Indicates that the array is empty.
         */
        case emptyArray
        
        /**
         Indicates an invalid index.
         */
        case invalidIndex
        
        /**
         Indicates an invalid range.
         */
        case invalidRange
        
        /**
         A title describing the error.
         */
        public var title: String {
            switch self {
            case .emptyArray:
                return "Empty Array"
            case .invalidIndex:
                return "Invalid Index"
            case .invalidRange:
                return "Invalid Range"
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
            case .invalidRange:
                return "The range is invalid."
            }
        }
    }
}
