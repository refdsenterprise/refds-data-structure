import Foundation

public final class AdjacencyMatrix<T: Hashable> {
    private var adjacencyMatrix: [[Bool]]
    private var vertexMap: [T: Int]
    
    /**
     Initializes an empty Adjacency Matrix.
     */
    public init() {
        adjacencyMatrix = []
        vertexMap = [:]
    }
    
    /**
     Adds a directed edge from a source vertex to a destination vertex in the Adjacency Matrix.
     
     - Parameters:
        - source: The source vertex.
        - destination: The destination vertex.
     - Throws: `AdjacencyMatrixError.vertexNotFound` if either the source or destination vertex does not exist in the matrix.
     */
    public func addEdge(from source: T, to destination: T) throws {
        guard let sourceIndex = vertexMap[source], let destinationIndex = vertexMap[destination] else {
            throw AdjacencyMatrixError.vertexNotFound
        }
        
        adjacencyMatrix[sourceIndex][destinationIndex] = true
    }
    
    /**
     Adds an undirected edge between two vertices in the Adjacency Matrix.
     
     - Parameters:
        - vertex1: The first vertex.
        - vertex2: The second vertex.
     - Throws: `AdjacencyMatrixError.vertexNotFound` if either vertex1 or vertex2 does not exist in the matrix.
     */
    public func addUndirectedEdge(between vertex1: T, and vertex2: T) throws {
        try addEdge(from: vertex1, to: vertex2)
        try addEdge(from: vertex2, to: vertex1)
    }
    
    /**
     Adds a vertex to the Adjacency Matrix.
     
     - Parameter vertex: The vertex to be added.
     */
    public func addVertex(_ vertex: T) {
        if !vertexMap.keys.contains(vertex) {
            let newIndex = adjacencyMatrix.count
            vertexMap[vertex] = newIndex
            
            // Add new row
            adjacencyMatrix.append(Array(repeating: false, count: newIndex + 1))
            
            // Update existing rows
            for index in adjacencyMatrix.indices {
                adjacencyMatrix[index].append(false)
            }
        }
    }
    
    /**
     Removes a vertex from the Adjacency Matrix.
     
     - Parameter vertex: The vertex to be removed.
     - Throws: `AdjacencyMatrixError.vertexNotFound` if the vertex does not exist in the matrix.
     */
    public func removeVertex(_ vertex: T) throws {
        guard let vertexIndex = vertexMap[vertex] else {
            throw AdjacencyMatrixError.vertexNotFound
        }
        
        // Remove the vertex from the vertex map
        vertexMap[vertex] = nil
        
        // Remove the row for the vertex
        adjacencyMatrix.remove(at: vertexIndex)
        
        // Remove the column for the vertex
        for i in 0..<adjacencyMatrix.count {
            adjacencyMatrix[i].remove(at: vertexIndex)
        }
        
        // Update the vertex indices in the vertex map
        for (v, index) in vertexMap {
            if index > vertexIndex {
                vertexMap[v] = index - 1
            }
        }
    }
    
    /**
     Removes an edge from the Adjacency Matrix between a source and destination vertex.
     
     - Parameters:
        - source: The source vertex.
        - destination: The destination vertex.
     - Throws: `AdjacencyMatrixError.vertexNotFound` if either the source or destination vertex does not exist in the matrix.
     */
    public func removeEdge(from source: T, to destination: T) throws {
        guard let sourceIndex = vertexMap[source], let destinationIndex = vertexMap[destination] else {
            throw AdjacencyMatrixError.vertexNotFound
        }
        
        adjacencyMatrix[sourceIndex][destinationIndex] = false
    }
    
    /**
     Returns the neighbors of a given vertex.
     
     - Parameter vertex: The vertex to get the neighbors of.
     - Returns: An array of vertices that are neighbors of the given vertex.
     - Throws: `AdjacencyMatrixError.vertexNotFound` if the vertex does not exist in the matrix.
     */
    public func neighbors(of vertex: T) throws -> [T] {
        guard let vertexIndex = vertexMap[vertex] else {
            throw AdjacencyMatrixError.vertexNotFound
        }
        
        var neighbors: [T] = []
        for (v, index) in vertexMap {
            if adjacencyMatrix[vertexIndex][index] {
                neighbors.append(v)
            }
        }
        
        return neighbors
    }
    
    /**
     An error type that represents an invalid operation on the Adjacency Matrix.
     */
    public enum AdjacencyMatrixError: Error {
        /**
         Indicates that a vertex was not found in the matrix.
         */
        case vertexNotFound
        
        /**
         A title describing the error.
         */
        public var title: String {
            switch self {
            case .vertexNotFound:
                return "Vertex Not Found"
            }
        }
        
        /**
         A description of the error.
         */
        public var description: String {
            switch self {
            case .vertexNotFound:
                return "The specified vertex was not found in the Adjacency Matrix."
            }
        }
    }
}
