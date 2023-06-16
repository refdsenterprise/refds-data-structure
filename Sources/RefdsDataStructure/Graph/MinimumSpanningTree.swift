import Foundation

public final class MinimumSpanningTree<T: Hashable> {
    /**
     A structure representing an edge in a graph.
     */
    public struct Edge<T: Hashable>: Hashable {
        public let source: T
        public let destination: T
        public let weight: Double
    }
    
    private var graph: [T: [T: Double]]
    
    /**
     Initializes a Minimum Spanning Tree algorithm with the given graph.
     
     - Parameter graph: The graph represented as an adjacency matrix.
     */
    public init(graph: [T: [T: Double]]) {
        self.graph = graph
    }
    
    /**
     Finds the minimum spanning tree of the graph.
     
     - Returns: A set of edges that form the minimum spanning tree.
     - Throws: `MinimumSpanningTreeError.graphIsEmpty` if the graph is empty.
     */
    public func findMinimumSpanningTree() throws -> Set<Edge<T>> {
        guard !graph.isEmpty else {
            throw MinimumSpanningTreeError.graphIsEmpty
        }
        
        var mst: Set<Edge<T>> = []
        var visited: Set<T> = []
        
        // Start with a random vertex
        if let firstVertex = graph.keys.first {
            visited.insert(firstVertex)
        }
        
        while visited.count < graph.count {
            var minEdge: Edge<T>?
            var minWeight: Double = Double.infinity
            
            for visitedVertex in visited {
                for (neighbor, weight) in graph[visitedVertex] ?? [:] {
                    if !visited.contains(neighbor) && weight < minWeight {
                        minWeight = weight
                        minEdge = Edge(source: visitedVertex, destination: neighbor, weight: weight)
                    }
                }
            }
            
            if let edge = minEdge {
                mst.insert(edge)
                visited.insert(edge.destination)
            }
        }
        
        return mst
    }
    
    /**
     An error type that represents an invalid operation on the Minimum Spanning Tree algorithm.
     */
    public enum MinimumSpanningTreeError: Error {
        /**
         Indicates that the graph is empty.
         */
        case graphIsEmpty
        
        /**
         A title describing the error.
         */
        public var title: String {
            switch self {
            case .graphIsEmpty:
                return "Graph is Empty"
            }
        }
        
        /**
         A description of the error.
         */
        public var description: String {
            switch self {
            case .graphIsEmpty:
                return "The graph is empty. Cannot find a minimum spanning tree."
            }
        }
    }
}
