import Foundation

/**
 A generic Octree data structure implementation.
 */
public final class Octree<T> {
    private final class Node {
        var value: T?
        var children: [Node?]
        
        init() {
            self.value = nil
            self.children = Array(repeating: nil, count: 8)
        }
    }
    
    private let root: Node
    private let boundingBox: BoundingBox
    
    /**
     Initializes an empty Octree with a bounding box.
     
     - Parameter boundingBox: The bounding box of the Octree.
     */
    public init(boundingBox: BoundingBox) {
        self.root = Node()
        self.boundingBox = boundingBox
    }
    
    /**
     Inserts a value into the Octree.
     
     - Parameters:
        - value: The value to be inserted.
        - point: The 3D point associated with the value.
     */
    public func insert(_ value: T, at point: Point) throws {
        guard boundingBox.contains(point) else {
            throw OctreeError.outOfBounds
        }
        
        try insertValue(value, at: point, node: root, boundingBox: boundingBox)
    }
    
    /**
     Inserts a value recursively into the Octree.
     
     - Parameters:
        - value: The value to be inserted.
        - point: The 3D point associated with the value.
        - node: The current node in the Octree.
        - boundingBox: The bounding box of the current node.
     */
    private func insertValue(_ value: T, at point: Point, node: Node, boundingBox: BoundingBox) throws {
        if node.value == nil {
            node.value = value
            return
        }
        
        let octant = boundingBox.octantContaining(point)
        guard let childNode = node.children[octant] else {
            throw OctreeError.invalidOctant
        }
        
        let childBoundingBox = boundingBox.subBoundingBox(for: octant)
        try insertValue(value, at: point, node: childNode, boundingBox: childBoundingBox)
    }
    
    /**
     Searches for a value at a specific point in the Octree.
     
     - Parameter point: The 3D point to search for.
     - Returns: The value associated with the point, or `nil` if no value is found.
     */
    public func search(at point: Point) throws -> T? {
        guard boundingBox.contains(point) else {
            throw OctreeError.outOfBounds
        }
        
        return try searchValue(at: point, node: root, boundingBox: boundingBox)
    }
    
    /**
     Searches for a value recursively in the Octree.
     
     - Parameters:
        - point: The 3D point to search for.
        - node: The current node in the Octree.
        - boundingBox: The bounding box of the current node.
     - Returns: The value associated with the point, or `nil` if no value is found.
     */
    private func searchValue(at point: Point, node: Node, boundingBox: BoundingBox) throws -> T? {
        if node.value != nil {
            return node.value
        }
        
        let octant = boundingBox.octantContaining(point)
        guard let childNode = node.children[octant] else {
            throw OctreeError.invalidOctant
        }
        
        let childBoundingBox = boundingBox.subBoundingBox(for: octant)
        return try searchValue(at: point, node: childNode, boundingBox: childBoundingBox)
    }
    
    /**
     A bounding box representing a 3D region in the Octree.
     */
    public struct BoundingBox {
        let minX: Double
        let minY: Double
        let minZ: Double
        let maxX: Double
        let maxY: Double
        let maxZ: Double
        
        /**
         Initializes a bounding box with the given coordinates.
         
         - Parameters:
            - minX: The minimum x-coordinate of the bounding box.
            - minY: The minimum y-coordinate of the bounding box.
            - minZ: The minimum z-coordinate of the bounding box.
            - maxX: The maximum x-coordinate of the bounding box.
            - maxY: The maximum y-coordinate of the bounding box.
            - maxZ: The maximum z-coordinate of the bounding box.
         */
        public init(minX: Double, minY: Double, minZ: Double, maxX: Double, maxY: Double, maxZ: Double) {
            self.minX = minX
            self.minY = minY
            self.minZ = minZ
            self.maxX = maxX
            self.maxY = maxY
            self.maxZ = maxZ
        }
        
        /**
         Checks if a point is contained within the bounding box.
         
         - Parameter point: The point to check.
         - Returns: `true` if the point is contained, `false` otherwise.
         */
        public func contains(_ point: Point) -> Bool {
            return point.x >= minX && point.x <= maxX && point.y >= minY && point.y <= maxY && point.z >= minZ && point.z <= maxZ
        }
        
        /**
         Returns the octant containing a point in the bounding box.
         
         - Parameter point: The point to check.
         - Returns: The octant index (0-7) containing the point.
         */
        public func octantContaining(_ point: Point) -> Int {
            let midX = (minX + maxX) / 2
            let midY = (minY + maxY) / 2
            let midZ = (minZ + maxZ) / 2
            
            var octant = 0
            if point.x >= midX {
                octant |= 1
            }
            if point.y >= midY {
                octant |= 2
            }
            if point.z >= midZ {
                octant |= 4
            }
            
            return octant
        }
        
        /**
         Returns a sub-bounding box for a given octant.
         
         - Parameter octant: The octant index.
         - Returns: The sub-bounding box.
         */
        public func subBoundingBox(for octant: Int) -> BoundingBox {
            let midX = (minX + maxX) / 2
            let midY = (minY + maxY) / 2
            let midZ = (minZ + maxZ) / 2
            
            switch octant {
            case 0:
                return BoundingBox(minX: minX, minY: minY, minZ: minZ, maxX: midX, maxY: midY, maxZ: midZ)
            case 1:
                return BoundingBox(minX: midX, minY: minY, minZ: minZ, maxX: maxX, maxY: midY, maxZ: midZ)
            case 2:
                return BoundingBox(minX: minX, minY: midY, minZ: minZ, maxX: midX, maxY: maxY, maxZ: midZ)
            case 3:
                return BoundingBox(minX: midX, minY: midY, minZ: minZ, maxX: maxX, maxY: maxY, maxZ: midZ)
            case 4:
                return BoundingBox(minX: minX, minY: minY, minZ: midZ, maxX: midX, maxY: midY, maxZ: maxZ)
            case 5:
                return BoundingBox(minX: midX, minY: minY, minZ: midZ, maxX: maxX, maxY: midY, maxZ: maxZ)
            case 6:
                return BoundingBox(minX: minX, minY: midY, minZ: midZ, maxX: midX, maxY: maxY, maxZ: maxZ)
            case 7:
                return BoundingBox(minX: midX, minY: midY, minZ: midZ, maxX: maxX, maxY: maxY, maxZ: maxZ)
            default:
                fatalError("Invalid octant")
            }
        }
    }
    
    /**
     A 3D point with x, y, and z coordinates.
     */
    public struct Point {
        let x: Double
        let y: Double
        let z: Double
        
        /**
         Initializes a point with the given coordinates.
         
         - Parameters:
            - x: The x-coordinate of the point.
            - y: The y-coordinate of the point.
            - z: The z-coordinate of the point.
         */
        public init(x: Double, y: Double, z: Double) {
            self.x = x
            self.y = y
            self.z = z
        }
    }
    
    /**
     An error type that represents an invalid operation on the Octree.
     */
    public enum OctreeError: Error {
        /**
         Indicates that the point is out of bounds.
         */
        case outOfBounds
        
        /**
         Indicates an invalid octant.
         */
        case invalidOctant
        
        /**
         A title describing the error.
         */
        public var title: String {
            switch self {
            case .outOfBounds:
                return "Out of Bounds"
            case .invalidOctant:
                return "Invalid Octant"
            }
        }
        
        /**
         A description of the error.
         */
        public var description: String {
            switch self {
            case .outOfBounds:
                return "The point is out of the Octree's bounds."
            case .invalidOctant:
                return "The octant is invalid."
            }
        }
    }
}
