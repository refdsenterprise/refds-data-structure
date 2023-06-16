import XCTest
import RefdsDataStructure

class LinkedListTests: XCTestCase {

    // MARK: - Initialization Tests
    
    func testInit() {
        let list = LinkedList<Int>()
        XCTAssertTrue(list.isEmpty)
        XCTAssertNil(list.first)
        XCTAssertNil(list.last)
    }
    
    // MARK: - Append Tests
    
    func testAppend() {
        let list = LinkedList<Int>()
        
        list.append(value: 1)
        list.append(value: 2)
        list.append(value: 3)
        
        XCTAssertFalse(list.isEmpty)
        XCTAssertEqual(list.first, 1)
        XCTAssertEqual(list.last, 3)
    }
    
    // MARK: - Insert Tests
    
    func testInsertAtHead() {
        let list = LinkedList<Int>()
        
        list.insert(value: 3, atIndex: 0)
        list.insert(value: 2, atIndex: 0)
        list.insert(value: 1, atIndex: 0)
        
        XCTAssertEqual(list.first, 1)
        XCTAssertEqual(list.last, 3)
    }
    
    func testInsertInBetween() {
        let list = LinkedList<Int>()
        
        list.append(value: 1)
        list.append(value: 3)
        
        list.insert(value: 2, atIndex: 1)
        
        XCTAssertEqual(list.first, 1)
        XCTAssertEqual(list.last, 3)
    }
    
    func testInsertAtTail() {
        let list = LinkedList<Int>()
        
        list.append(value: 1)
        list.append(value: 2)
        
        list.insert(value: 3, atIndex: 2)
        
        XCTAssertEqual(list.first, 1)
        XCTAssertEqual(list.last, 3)
    }
    
    // MARK: - Remove Tests
    
    func testRemoveAtHead() {
        let list = LinkedList<Int>()
        
        list.append(value: 1)
        list.append(value: 2)
        list.append(value: 3)
        
        list.remove(atIndex: 0)
        
        XCTAssertEqual(list.first, 2)
        XCTAssertEqual(list.last, 3)
    }
    
    func testRemoveInBetween() {
        let list = LinkedList<Int>()
        
        list.append(value: 1)
        list.append(value: 2)
        list.append(value: 3)
        
        list.remove(atIndex: 1)
        
        XCTAssertEqual(list.first, 1)
        XCTAssertEqual(list.last, 3)
    }
    
    func testRemoveAtTail() {
        let list = LinkedList<Int>()
        
        list.append(value: 1)
        list.append(value: 2)
        list.append(value: 3)
        
        list.remove(atIndex: 2)
        
        XCTAssertEqual(list.first, 1)
        XCTAssertEqual(list.last, 2)
    }
    
    // MARK: - Contains Tests
    
    func testContains() {
        let list = LinkedList<Int>()
        
        list.append(value: 1)
        list.append(value: 2)
        list.append(value: 3)
        
        XCTAssertTrue(try list.contains(value: 2))
        XCTAssertThrowsError(try list.contains(value: 4)) { error in
            XCTAssertEqual(error as? LinkedList<Int>.LinkedListError, .valueNotFound)
        }
    }
    
    func testContainsEmptyList() {
        let list = LinkedList<Int>()
        
        XCTAssertThrowsError(try list.contains(value: 1)) { error in
            XCTAssertEqual(error as? LinkedList<Int>.LinkedListError, .valueNotFound)
        }
    }
    
    // MARK: - Index Tests
    
    func testIndex() {
        let list = LinkedList<Int>()
        
        list.append(value: 1)
        list.append(value: 2)
        list.append(value: 3)
        
        XCTAssertEqual(try list.index(of: 2), 1)
    }
    
    func testIndexNotFound() {
        let list = LinkedList<Int>()
        
        list.append(value: 1)
        list.append(value: 2)
        list.append(value: 3)
        
        XCTAssertThrowsError(try list.index(of: 4)) { error in
            XCTAssertEqual(error as? LinkedList<Int>.LinkedListError, .valueNotFound)
        }
    }

    // MARK: - LinkedListError Tests
    
    func testLinkedListErrorTitle() {
        XCTAssertEqual(LinkedList<Int>.LinkedListError.valueNotFound.title, "Value Not Found")
    }
    
    func testLinkedListErrorDescription() {
        XCTAssertEqual(LinkedList<Int>.LinkedListError.valueNotFound.description, "The specified value was not found in the linked list.")
    }
}


