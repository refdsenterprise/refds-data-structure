import XCTest
import RefdsDataStructure

class SkipListTests: XCTestCase {
    func testSkipList() {
        let maxLevel = 5
        let probability = 0.5
        let key = 10
        let value = "Hello, Skip List!"
        
        let skipList = SkipList(maxLevel: maxLevel, probability: probability, key: key, value: value)
        
        // Test insert
        skipList.insert(5, value: "Value 5")
        skipList.insert(7, value: "Value 7")
        skipList.insert(15, value: "Value 15")
        skipList.insert(20, value: "Value 20")
        skipList.insert(12, value: "Value 12")
        
        // Test search
        XCTAssertNil(skipList.search(25))
        XCTAssertNil(skipList.search(3))
    }
}
