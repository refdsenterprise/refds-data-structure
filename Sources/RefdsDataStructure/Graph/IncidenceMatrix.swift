import Foundation

public final class IncidenceMatrix<T: Hashable> {
    private var incidenceMatrix: [[Bool]]
    private var vertexMap: [T: Int]
    
    /**
     Initializes an empty Incidence Matrix.
     */
    public init() {
        incidenceMatrix = []
        vertexMap = [:]
    }
    
    /**
     Adds an edge to the Incidence Matrix between two vertices.
     
     - Parameters:
        - source: The source vertex.
        - destination: The destination vertex.
     - Throws: `IncidenceMatrixError.vertexNotFound` if either the source or destination vertex does not exist in the matrix.
     */
    public func addEdge(from source: T, to destination: T) throws {
        guard let sourceIndex = vertexMap[source], let destinationIndex = vertexMap[destination] else {
            throw IncidenceMatrixError.vertexNotFound
        }
        
        incidenceMatrix.append(Array(repeating: false, count: vertexMap.count))
        incidenceMatrix[incidenceMatrix.count - 1][sourceIndex] = true
        incidenceMatrix[incidenceMatrix.count - 1][destinationIndex] = true
    }
    
    /**
     Adds a vertex to the Incidence Matrix.
     
     - Parameter vertex: The vertex to be added.
     */
    public func addVertex(_ vertex: T) {
        if !vertexMap.keys.contains(vertex) {
            let newIndex = incidenceMatrix.count
            vertexMap[vertex] = newIndex
            
            for i in 0..<incidenceMatrix.count {
                incidenceMatrix[i].append(false)
            }
        }
    }
    
    /**
     Removes a vertex from the Incidence Matrix.
     
     - Parameter vertex: The vertex to be removed.
     - Throws: `IncidenceMatrixError.vertexNotFound` if the vertex does not exist in the matrix.
     */
    public func removeVertex(_ vertex: T) throws {
        guard let vertexIndex = vertexMap[vertex] else {
            throw IncidenceMatrixError.vertexNotFound
        }
        
        // Remove the vertex from the vertex map
        vertexMap[vertex] = nil
        
        // Remove the row for the vertex
        incidenceMatrix.remove(at: vertexIndex)
        
        // Remove the vertex column from each row
        for i in 0..<incidenceMatrix.count {
            incidenceMatrix[i].remove(at: vertexIndex)
        }
        
        // Update the vertex indices in the vertex map
        for (v, index) in vertexMap {
            if index > vertexIndex {
                vertexMap[v] = index - 1
            }
        }
    }
    
    /**
     Removes an edge from the Incidence Matrix between two vertices.
     
     - Parameters:
        - source: The source vertex.
        - destination: The destination vertex.
     - Throws: `IncidenceMatrixError.vertexNotFound` if either the source or destination vertex does not exist in the matrix.
     */
    public func removeEdge(from source: T, to destination: T) throws {
        guard let sourceIndex = vertexMap[source], let destinationIndex = vertexMap[destination] else {
            throw IncidenceMatrixError.vertexNotFound
        }
        
        for i in 0..<incidenceMatrix.count {
            if incidenceMatrix[i][sourceIndex] && incidenceMatrix[i][destinationIndex] {
                incidenceMatrix.remove(at: i)
                break
            }
        }
    }
    
    /**
     Returns the neighbors of a given vertex.
     
     - Parameter vertex: The vertex to get the neighbors of.
     - Returns: An array of vertices that are neighbors of the given vertex.
     - Throws: `IncidenceMatrixError.vertexNotFound` if the vertex does not exist in the matrix.
     */
    public func neighbors(of vertex: T) throws -> [T] {
        guard let vertexIndex = vertexMap[vertex] else {
            throw IncidenceMatrixError.vertexNotFound
        }
        
        var neighbors: [T] = []
        for i in 0..<incidenceMatrix.count {
            if incidenceMatrix[i][vertexIndex] {
                for (v, index) in vertexMap {
                    if incidenceMatrix[i][index] && v != vertex {
                        neighbors.append(v)
                    }
                }
                break
            }
        }
        
        return neighbors
    }
    
    /**
     An error type that represents an invalid operation on the Incidence Matrix.
     */
    public enum IncidenceMatrixError: Error {
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
                return "The specified vertex was not found in the Incidence Matrix."
            }
        }
    }
}

