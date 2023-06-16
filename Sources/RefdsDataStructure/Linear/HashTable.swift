import Foundation

/**
 A generic hash table data structure implementation.
 */
public final class HashTable<Key: Hashable, Value> {
    private var buckets: [[(key: Key, value: Value)]]
    
    /**
     Initializes an empty hash table with the specified capacity.
     
     - Parameter capacity: The initial capacity of the hash table.
     */
    public init(capacity: Int) {
        assert(capacity > 0, "Capacity must be a positive value.")
        self.buckets = Array(repeating: [], count: capacity)
    }
    
    /**
     Subscript to get or set the value associated with the specified key.
     
     - Parameter key: The key to look up or set the value.
     - Returns: The value associated with the key, or `nil` if the key is not found.
     */
    public subscript(key: Key) -> Value? {
        get {
            return value(forKey: key)
        }
        set {
            if let value = newValue {
                updateValue(value, forKey: key)
            } else {
                removeValue(forKey: key)
            }
        }
    }
    
    /**
     Returns the value associated with the specified key.
     
     - Parameter key: The key to look up the value.
     - Returns: The value associated with the key, or `nil` if the key is not found.
     */
    public func value(forKey key: Key) -> Value? {
        let index = indexForKey(key)
        
        for entry in buckets[index] {
            if entry.key == key {
                return entry.value
            }
        }
        
        return nil
    }
    
    /**
     Updates the value associated with the specified key.
     
     - Parameters:
        - value: The new value to associate with the key.
        - key: The key to update the value.
     - Returns: The old value associated with the key, or `nil` if the key is not found.
     */
    @discardableResult
    public func updateValue(_ value: Value, forKey key: Key) -> Value? {
        let index = indexForKey(key)
        
        for (i, entry) in buckets[index].enumerated() {
            if entry.key == key {
                let oldValue = entry.value
                buckets[index][i].value = value
                return oldValue
            }
        }
        
        buckets[index].append((key: key, value: value))
        return nil
    }
    
    /**
     Removes the value associated with the specified key.
     
     - Parameter key: The key to remove the value.
     - Returns: The value associated with the key, or `nil` if the key is not found.
     */
    @discardableResult
    public func removeValue(forKey key: Key) -> Value? {
        let index = indexForKey(key)
        
        for (i, entry) in buckets[index].enumerated() {
            if entry.key == key {
                buckets[index].remove(at: i)
                return entry.value
            }
        }
        
        return nil
    }
    
    /**
     Returns the index in the buckets array for the specified key.
     
     - Parameter key: The key to calculate the index.
     - Returns: The index in the buckets array.
     */
    private func indexForKey(_ key: Key) -> Int {
        let hashCode = abs(key.hashValue)
        return hashCode % buckets.count
    }
    
    /**
     An error type that represents a key not found in the hash table.
     */
    public enum HashTableError: Error {
        /**
         Indicates that the key was not found in the hash table.
         */
        case keyNotFound
        
        /**
         A title describing the error.
         */
        public var title: String {
            switch self {
            case .keyNotFound:
                return "Key Not Found"
            }
        }
        
        /**
         A description of the error.
         */
        public var description: String {
            switch self {
            case .keyNotFound:
                return "The specified key was not found in the hash table."
            }
        }
    }
}
