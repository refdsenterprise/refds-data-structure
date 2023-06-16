import XCTest
import RefdsDataStructure

class DoublyLinkedListTests: XCTestCase {
    func testAppendingElements() {
        let list = DoublyLinkedList<Int>()
        XCTAssertTrue(list.isEmpty)
        XCTAssertEqual(list.count, 0)
        
        list.append(1)
        XCTAssertFalse(list.isEmpty)
        XCTAssertEqual(list.count, 1)
        XCTAssertEqual(list.element(at: 0), 1)
        
        list.append(2)
        XCTAssertFalse(list.isEmpty)
        XCTAssertEqual(list.count, 2)
        XCTAssertEqual(list.element(at: 1), 2)
    }
    
    func testInsertingElements() throws {
        let list = DoublyLinkedList<String>()
        list.append("A")
        list.append("C")
        
        try list.insert("B", at: 1)
        
        XCTAssertEqual(list.count, 3)
        XCTAssertEqual(list.element(at: 0), "A")
        XCTAssertEqual(list.element(at: 1), "B")
        XCTAssertEqual(list.element(at: 2), "C")
        
        XCTAssertThrowsError(try list.insert("D", at: 4)) { error in
            XCTAssertEqual(error as? DoublyLinkedList<String>.DoublyLinkedListError, DoublyLinkedList<String>.DoublyLinkedListError.indexOutOfRange)
            XCTAssertEqual((error as? DoublyLinkedList<String>.DoublyLinkedListError)?.title, "Index Out Of Range")
            XCTAssertEqual((error as? DoublyLinkedList<String>.DoublyLinkedListError)?.description, "The index is out of range.")
        }
    }
    
    func testRemovingElements() throws {
        let list = DoublyLinkedList<Character>(elements: ["A", "B", "C"])
        
        try list.remove(at: 1)
        
        XCTAssertEqual(list.count, 2)
        XCTAssertEqual(list.element(at: 0), "A")
        XCTAssertEqual(list.element(at: 1), "C")
        
        XCTAssertThrowsError(try list.remove(at: 2)) { error in
            XCTAssertEqual(error as? DoublyLinkedList<Character>.DoublyLinkedListError, DoublyLinkedList<Character>.DoublyLinkedListError.indexOutOfRange)
            XCTAssertEqual((error as? DoublyLinkedList<Character>.DoublyLinkedListError)?.title, "Index Out Of Range")
            XCTAssertEqual((error as? DoublyLinkedList<Character>.DoublyLinkedListError)?.description, "The index is out of range.")
        }
    }
    
    func testEmptyList() {
        let list = DoublyLinkedList<Int>()
        
        XCTAssertNil(list.element(at: 0))
        XCTAssertNil(list.element(at: 10))
    }
}
