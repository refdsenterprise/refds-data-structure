import Foundation

public final class DistanceMatrix<T: Hashable> {
    private var distanceMatrix: [T: [T: Double]]
    
    /**
     Initializes an empty Distance Matrix.
     */
    public init() {
        distanceMatrix = [:]
    }
    
    /**
     Adds a distance between two vertices in the Distance Matrix.
     
     - Parameters:
        - source: The source vertex.
        - destination: The destination vertex.
        - distance: The distance between the vertices.
     - Throws: `DistanceMatrixError.vertexNotFound` if either the source or destination vertex does not exist in the matrix.
     */
    public func addDistance(from source: T, to destination: T, distance: Double) throws {
        guard distance.isFinite else {
            throw DistanceMatrixError.invalidDistance
        }
        
        if distanceMatrix[source] == nil {
            distanceMatrix[source] = [:]
        }
        distanceMatrix[source]?[destination] = distance
        
        if distanceMatrix[destination] == nil {
            distanceMatrix[destination] = [:]
        }
        distanceMatrix[destination]?[source] = distance
    }
    
    /**
     Adds a vertex to the Distance Matrix.
     
     - Parameter vertex: The vertex to be added.
     */
    public func addVertex(_ vertex: T) {
        if distanceMatrix[vertex] == nil {
            distanceMatrix[vertex] = [:]
        }
    }
    
    /**
     Removes a vertex from the Distance Matrix.
     
     - Parameter vertex: The vertex to be removed.
     - Throws: `DistanceMatrixError.vertexNotFound` if the vertex does not exist in the matrix.
     */
    public func removeVertex(_ vertex: T) throws {
        guard distanceMatrix.keys.contains(vertex) else {
            throw DistanceMatrixError.vertexNotFound
        }
        
        distanceMatrix.removeValue(forKey: vertex)
        
        for (source, _) in distanceMatrix {
            distanceMatrix[source]?.removeValue(forKey: vertex)
        }
    }
    
    /**
     Removes a distance between two vertices in the Distance Matrix.
     
     - Parameters:
        - source: The source vertex.
        - destination: The destination vertex.
     - Throws: `DistanceMatrixError.vertexNotFound` if either the source or destination vertex does not exist in the matrix.
     */
    public func removeDistance(from source: T, to destination: T) throws {
        guard let _ = distanceMatrix[source], let _ = distanceMatrix[destination] else {
            throw DistanceMatrixError.vertexNotFound
        }
        
        distanceMatrix[source]?.removeValue(forKey: destination)
        distanceMatrix[destination]?.removeValue(forKey: source)
    }
    
    /**
     Returns the distance between two vertices in the Distance Matrix.
     
     - Parameters:
        - source: The source vertex.
        - destination: The destination vertex.
     - Returns: The distance between the vertices, or `nil` if the vertices are not connected.
     - Throws: `DistanceMatrixError.vertexNotFound` if either the source or destination vertex does not exist in the matrix.
     */
    public func distance(from source: T, to destination: T) throws -> Double? {
        guard let sourceDistances = distanceMatrix[source] else {
            throw DistanceMatrixError.vertexNotFound
        }
        
        return sourceDistances[destination]
    }
    
    /**
     An error type that represents an invalid operation on the Distance Matrix.
     */
    public enum DistanceMatrixError: Error {
        /**
         Indicates that a vertex was not found in the matrix.
         */
        case vertexNotFound
        
        /**
         Indicates that an invalid distance value was provided.
         */
        case invalidDistance
        
        /**
         A title describing the error.
         */
        public var title: String {
            switch self {
            case .vertexNotFound:
                return "Vertex Not Found"
            case .invalidDistance:
                return "Invalid Distance"
            }
        }
        
        /**
         A description of the error.
         */
        public var description: String {
            switch self {
            case .vertexNotFound:
                return "The specified vertex was not found in the Distance Matrix."
            case .invalidDistance:
                return "The provided distance value is not valid."
            }
        }
    }
}
