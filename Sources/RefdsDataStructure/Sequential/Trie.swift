import Foundation

/**
 A generic Trie (Prefix Tree) data structure implementation.
 */
public final class Trie<Value> {
    private final class Node {
        var value: Value?
        var children: [Character: Node]
        var isEndOfWord: Bool
        
        init() {
            self.value = nil
            self.children = [:]
            self.isEndOfWord = false
        }
    }
    
    private let root: Node
    
    /**
     Initializes an empty Trie.
     */
    public init() {
        self.root = Node()
    }
    
    /**
     Inserts a word into the Trie.
     
     - Parameters:
        - word: The word to be inserted.
        - value: The value associated with the word.
     */
    public func insert(_ word: String, value: Value) {
        var currentNode = root
        
        for char in word {
            if let childNode = currentNode.children[char] {
                currentNode = childNode
            } else {
                let newNode = Node()
                currentNode.children[char] = newNode
                currentNode = newNode
            }
        }
        
        currentNode.value = value
        currentNode.isEndOfWord = true
    }
    
    /**
     Searches for a word in the Trie.
     
     - Parameter word: The word to search for.
     - Returns: The value associated with the word, or `nil` if the word is not found.
     */
    public func search(_ word: String) -> Value? {
        var currentNode = root
        
        for char in word {
            guard let childNode = currentNode.children[char] else {
                return nil
            }
            
            currentNode = childNode
        }
        
        return currentNode.value
    }
}
