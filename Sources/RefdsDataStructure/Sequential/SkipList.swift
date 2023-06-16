import Foundation

/**
 A generic Skip List data structure implementation.
 */
public final class SkipList<Key: Comparable, Value> {
    private final class Node {
        var key: Key
        var value: Value
        var forward: [Node?]
        
        init(key: Key, value: Value, level: Int) {
            self.key = key
            self.value = value
            self.forward = Array(repeating: nil, count: level)
        }
    }
    
    private let maxLevel: Int
    private let probability: Double
    private let head: Node
    private var currentLevel: Int
    
    /**
     Initializes an empty Skip List.
     
     - Parameters:
        - maxLevel: The maximum level of the Skip List.
        - probability: The probability used for level generation.
     */
    public init(maxLevel: Int, probability: Double, key: Key, value: Value) {
        self.maxLevel = maxLevel
        self.probability = probability
        self.head = Node(key: key, value: value, level: maxLevel)
        self.currentLevel = 0
    }
    
    /**
     Generates a random level for a new node.
     
     - Returns: The generated level.
     */
    private func randomLevel() -> Int {
        var level = 0
        while Double.random(in: 0..<1) < probability && level < maxLevel {
            level += 1
        }
        return level
    }
    
    /**
     Inserts a key-value pair into the Skip List.
     
     - Parameters:
        - key: The key to be inserted.
        - value: The value associated with the key.
     */
    public func insert(_ key: Key, value: Value) {
        var update = Array(repeating: Optional<Node>.none, count: maxLevel)
        var currentNode = head
        
        for level in stride(from: currentLevel, to: -1, by: -1) {
            while let nextNode = currentNode.forward[level], nextNode.key < key {
                currentNode = nextNode
            }
            update[level] = currentNode
        }
        
        if let currentNode = currentNode.forward[0] {
            if currentNode.key == key {
                currentNode.value = value
            } else {
                let newLevel = randomLevel()
                if newLevel > currentLevel {
                    for level in (currentLevel + 1)...newLevel {
                        update[level] = head
                    }
                    currentLevel = newLevel
                }
                
                let newNode = Node(key: key, value: value, level: newLevel)
                for level in 0...newLevel {
                    newNode.forward[level] = update[level]?.forward[level]
                    update[level]?.forward[level] = newNode
                }
            }
        }
    }
    
    /**
     Searches for a key in the Skip List.
     
     - Parameter key: The key to search for.
     - Returns: The value associated with the key, or `nil` if the key is not found.
     */
    public func search(_ key: Key) -> Value? {
        var currentNode = head
        
        for level in stride(from: currentLevel, to: -1, by: -1) {
            while let nextNode = currentNode.forward[level], nextNode.key < key {
                currentNode = nextNode
            }
        }
        
        guard let currentNode = currentNode.forward[0] else { return nil }
        
        if currentNode.key == key {
            return currentNode.value
        } else {
            return nil
        }
    }
}
