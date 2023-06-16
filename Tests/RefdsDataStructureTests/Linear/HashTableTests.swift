import XCTest
import RefdsDataStructure

class HashTableTests: XCTestCase {
    
    // MARK: - Initialization Tests
    
    func testInitWithCapacity() {
        let hashTable = HashTable<String, Int>(capacity: 10)
        XCTAssertNotNil(hashTable)
    }
    
    // MARK: - Subscript Tests
    
    func testSubscriptGet() {
        let hashTable = HashTable<String, Int>(capacity: 10)
        hashTable["key"] = 123
        
        XCTAssertEqual(hashTable["key"], 123)
    }
    
    func testSubscriptSet() {
        let hashTable = HashTable<String, Int>(capacity: 10)
        hashTable["key"] = 123
        
        XCTAssertEqual(hashTable["key"], 123)
        
        hashTable["key"] = 456
        
        XCTAssertEqual(hashTable["key"], 456)
    }
    
    func testSubscriptRemove() {
        let hashTable = HashTable<String, Int>(capacity: 10)
        hashTable["key"] = 123
        
        XCTAssertEqual(hashTable["key"], 123)
        
        hashTable["key"] = nil
        
        XCTAssertNil(hashTable["key"])
    }
    
    // MARK: - Value Tests
    
    func testValueForKey() {
        let hashTable = HashTable<String, Int>(capacity: 10)
        hashTable["key1"] = 123
        hashTable["key2"] = 456
        
        XCTAssertEqual(hashTable.value(forKey: "key1"), 123)
        XCTAssertEqual(hashTable.value(forKey: "key2"), 456)
        XCTAssertNil(hashTable.value(forKey: "key3"))
    }
    
    func testUpdateValueForKey() {
        let hashTable = HashTable<String, Int>(capacity: 10)
        hashTable["key"] = 123
        
        XCTAssertEqual(hashTable.updateValue(456, forKey: "key"), 123)
        XCTAssertEqual(hashTable.value(forKey: "key"), 456)
        XCTAssertNil(hashTable.updateValue(789, forKey: "nonexistentKey"))
    }
    
    func testRemoveValueForKey() {
        let hashTable = HashTable<String, Int>(capacity: 10)
        hashTable["key"] = 123
        
        XCTAssertEqual(hashTable.removeValue(forKey: "key"), 123)
        XCTAssertNil(hashTable.value(forKey: "key"))
        XCTAssertNil(hashTable.removeValue(forKey: "nonexistentKey"))
    }
    
    // MARK: - HashTableError Tests
    
    func testHashTableErrorTitle() {
        XCTAssertEqual(HashTable<String, Int>.HashTableError.keyNotFound.title, "Key Not Found")
    }
    
    func testHashTableErrorDescription() {
        XCTAssertEqual(HashTable<String, Int>.HashTableError.keyNotFound.description, "The specified key was not found in the hash table.")
    }
}
