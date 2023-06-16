import Foundation

public final class AdjacencyList<T: Hashable> {
    private var adjacencyList: [T: Set<T>]
    
    /**
     Initializes an empty Adjacency List.
     */
    public init() {
        adjacencyList = [:]
    }
    
    /**
     Adds a directed edge from a source vertex to a destination vertex in the Adjacency List.
     
     - Parameters:
        - source: The source vertex.
        - destination: The destination vertex.
     - Throws: `AdjacencyListError.vertexNotFound` if either the source or destination vertex does not exist in the list.
     */
    public func addEdge(from source: T, to destination: T) throws {
        guard adjacencyList.keys.contains(source) && adjacencyList.keys.contains(destination) else {
            throw AdjacencyListError.vertexNotFound
        }
        
        adjacencyList[source]?.insert(destination)
    }
    
    /**
     Adds an undirected edge between two vertices in the Adjacency List.
     
     - Parameters:
        - vertex1: The first vertex.
        - vertex2: The second vertex.
     - Throws: `AdjacencyListError.vertexNotFound` if either vertex1 or vertex2 does not exist in the list.
     */
    public func addUndirectedEdge(between vertex1: T, and vertex2: T) throws {
        try addEdge(from: vertex1, to: vertex2)
        try addEdge(from: vertex2, to: vertex1)
    }
    
    /**
     Adds a vertex to the Adjacency List.
     
     - Parameter vertex: The vertex to be added.
     */
    public func addVertex(_ vertex: T) {
        adjacencyList[vertex] = Set<T>()
    }
    
    /**
     Removes a vertex from the Adjacency List.
     
     - Parameter vertex: The vertex to be removed.
     - Throws: `AdjacencyListError.vertexNotFound` if the vertex does not exist in the list.
     */
    public func removeVertex(_ vertex: T) throws {
        guard adjacencyList.keys.contains(vertex) else {
            throw AdjacencyListError.vertexNotFound
        }
        
        adjacencyList[vertex] = nil
        
        for (source, _) in adjacencyList {
            adjacencyList[source]?.remove(vertex)
        }
    }
    
    /**
     Removes an edge from the Adjacency List between a source and destination vertex.
     
     - Parameters:
        - source: The source vertex.
        - destination: The destination vertex.
     - Throws: `AdjacencyListError.vertexNotFound` if either the source or destination vertex does not exist in the list.
     */
    public func removeEdge(from source: T, to destination: T) throws {
        guard adjacencyList.keys.contains(source) && adjacencyList.keys.contains(destination) else {
            throw AdjacencyListError.vertexNotFound
        }
        
        adjacencyList[source]?.remove(destination)
    }
    
    /**
     Returns the neighbors of a given vertex.
     
     - Parameter vertex: The vertex to get the neighbors of.
     - Returns: A set of vertices that are neighbors of the given vertex.
     - Throws: `AdjacencyListError.vertexNotFound` if the vertex does not exist in the list.
     */
    public func neighbors(of vertex: T) throws -> Set<T> {
        guard adjacencyList.keys.contains(vertex) else {
            throw AdjacencyListError.vertexNotFound
        }
        
        return adjacencyList[vertex]!
    }
    
    /**
     An error type that represents an invalid operation on the Adjacency List.
     */
    public enum AdjacencyListError: Error {
        /**
         Indicates that a vertex was not found in the list.
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
                return "The specified vertex was not found in the Adjacency List."
            }
        }
    }
}
