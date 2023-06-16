import Foundation

/**
 A generic Quadtree data structure implementation.
 */
public final class Quadtree<T> {
    private final class Node {
        var value: T?
        var children: [Node?]
        
        init() {
            self.value = nil
            self.children = Array(repeating: nil, count: 4)
        }
    }
    
    private let root: Node
    private let boundingBox: BoundingBox
    
    /**
     Initializes an empty Quadtree with a bounding box.
     
     - Parameter boundingBox: The bounding box of the Quadtree.
     */
    public init(boundingBox: BoundingBox) {
        self.root = Node()
        self.boundingBox = boundingBox
    }
    
    /**
     Inserts a value into the Quadtree.
     
     - Parameters:
        - value: The value to be inserted.
        - point: The 2D point associated with the value.
     */
    public func insert(_ value: T, at point: Point) throws {
        guard boundingBox.contains(point) else {
            throw QuadtreeError.outOfBounds
        }
        
        try insertValue(value, at: point, node: root, boundingBox: boundingBox)
    }
    
    /**
     Inserts a value recursively into the Quadtree.
     
     - Parameters:
        - value: The value to be inserted.
        - point: The 2D point associated with the value.
        - node: The current node in the Quadtree.
        - boundingBox: The bounding box of the current node.
     */
    private func insertValue(_ value: T, at point: Point, node: Node, boundingBox: BoundingBox) throws {
        if node.value == nil {
            node.value = value
            return
        }
        
        let quadrant = boundingBox.quadrantContaining(point)
        guard let childNode = node.children[quadrant] else {
            throw QuadtreeError.invalidQuadrant
        }
        
        let childBoundingBox = boundingBox.subBoundingBox(for: quadrant)
        try insertValue(value, at: point, node: childNode, boundingBox: childBoundingBox)
    }
    
    /**
     Searches for a value at a specific point in the Quadtree.
     
     - Parameter point: The 2D point to search for.
     - Returns: The value associated with the point, or `nil` if no value is found.
     */
    public func search(at point: Point) throws -> T? {
        guard boundingBox.contains(point) else {
            throw QuadtreeError.outOfBounds
        }
        
        return try searchValue(at: point, node: root, boundingBox: boundingBox)
    }
    
    /**
     Searches for a value recursively in the Quadtree.
     
     - Parameters:
        - point: The 2D point to search for.
        - node: The current node in the Quadtree.
        - boundingBox: The bounding box of the current node.
     - Returns: The value associated with the point, or `nil` if no value is found.
     */
    private func searchValue(at point: Point, node: Node, boundingBox: BoundingBox) throws -> T? {
        if node.value != nil {
            return node.value
        }
        
        let quadrant = boundingBox.quadrantContaining(point)
        guard let childNode = node.children[quadrant] else {
            throw QuadtreeError.invalidQuadrant
        }
        
        let childBoundingBox = boundingBox.subBoundingBox(for: quadrant)
        return try searchValue(at: point, node: childNode, boundingBox: childBoundingBox)
    }
    
    /**
     A bounding box representing a rectangular region in the Quadtree.
     */
    public struct BoundingBox {
        let minX: Double
        let minY: Double
        let maxX: Double
        let maxY: Double
        
        /**
         Initializes a bounding box with the given coordinates.
         
         - Parameters:
            - minX: The minimum x-coordinate of the bounding box.
            - minY: The minimum y-coordinate of the bounding box.
            - maxX: The maximum x-coordinate of the bounding box.
            - maxY: The maximum y-coordinate of the bounding box.
         */
        public init(minX: Double, minY: Double, maxX: Double, maxY: Double) {
            self.minX = minX
            self.minY = minY
            self.maxX = maxX
            self.maxY = maxY
        }
        
        /**
         Checks if a point is contained within the bounding box.
         
         - Parameter point: The point to check.
         - Returns: `true` if the point is contained, `false` otherwise.
         */
        public func contains(_ point: Point) -> Bool {
            return point.x >= minX && point.x <= maxX && point.y >= minY && point.y <= maxY
        }
        
        /**
         Returns the quadrant containing a point in the bounding box.
         
         - Parameter point: The point to check.
         - Returns: The quadrant index (0-3) containing the point.
         */
        public func quadrantContaining(_ point: Point) -> Int {
            let midX = (minX + maxX) / 2
            let midY = (minY + maxY) / 2
            
            if point.x <= midX {
                if point.y <= midY {
                    return 0
                } else {
                    return 2
                }
            } else {
                if point.y <= midY {
                    return 1
                } else {
                    return 3
                }
            }
        }
        
        /**
         Returns a sub-bounding box for a given quadrant.
         
         - Parameter quadrant: The quadrant index.
         - Returns: The sub-bounding box.
         */
        public func subBoundingBox(for quadrant: Int) -> BoundingBox {
            let midX = (minX + maxX) / 2
            let midY = (minY + maxY) / 2
            
            switch quadrant {
            case 0:
                return BoundingBox(minX: minX, minY: minY, maxX: midX, maxY: midY)
            case 1:
                return BoundingBox(minX: midX, minY: minY, maxX: maxX, maxY: midY)
            case 2:
                return BoundingBox(minX: minX, minY: midY, maxX: midX, maxY: maxY)
            case 3:
                return BoundingBox(minX: midX, minY: midY, maxX: maxX, maxY: maxY)
            default:
                fatalError("Invalid quadrant")
            }
        }
    }
    
    /**
     A 2D point with x and y coordinates.
     */
    public struct Point {
        let x: Double
        let y: Double
        
        /**
         Initializes a point with the given coordinates.
         
         - Parameters:
            - x: The x-coordinate of the point.
            - y: The y-coordinate of the point.
         */
        public init(x: Double, y: Double) {
            self.x = x
            self.y = y
        }
    }
    
    /**
     An error type that represents an invalid operation on the Quadtree.
     */
    public enum QuadtreeError: Error {
        /**
         Indicates that the point is out of bounds.
         */
        case outOfBounds
        
        /**
         Indicates an invalid quadrant.
         */
        case invalidQuadrant
        
        /**
         A title describing the error.
         */
        public var title: String {
            switch self {
            case .outOfBounds:
                return "Out of Bounds"
            case .invalidQuadrant:
                return "Invalid Quadrant"
            }
        }
        
        /**
         A description of the error.
         */
        public var description: String {
            switch self {
            case .outOfBounds:
                return "The point is out of the Quadtree's bounds."
            case .invalidQuadrant:
                return "The quadrant is invalid."
            }
        }
    }
}
