import XCTest
import RefdsDataStructure

class TrieTests: XCTestCase {
    func testTrie() {
        let trie = Trie<String>()
        
        // Test insert
        trie.insert("apple", value: "Apple")
        trie.insert("banana", value: "Banana")
        trie.insert("orange", value: "Orange")
        trie.insert("grape", value: "Grape")
        trie.insert("melon", value: "Melon")
        
        // Test search
        XCTAssertEqual(trie.search("apple"), "Apple")
        XCTAssertEqual(trie.search("banana"), "Banana")
        XCTAssertEqual(trie.search("orange"), "Orange")
        XCTAssertEqual(trie.search("grape"), "Grape")
        XCTAssertEqual(trie.search("melon"), "Melon")
        XCTAssertNil(trie.search("kiwi"))
        XCTAssertNil(trie.search("mango"))
    }
}
