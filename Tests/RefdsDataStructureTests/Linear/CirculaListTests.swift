import XCTest
import RefdsDataStructure

class CircularListTests: XCTestCase {
    
    // MARK: - Initialization Tests
    
    func testInit() {
        let list = CircularList<Int>()
        XCTAssertNotNil(list)
    }
    
    // MARK: - Append Tests
    
    func testAppendToEmptyList() {
        let list = CircularList<Int>()
        list.append(value: 1)
        
        XCTAssertTrue(list.contains(value: 1))
    }
    
    func testAppendToNonEmptyList() {
        let list = CircularList<Int>()
        list.append(value: 1)
        list.append(value: 2)
        
        XCTAssertTrue(list.contains(value: 1))
        XCTAssertTrue(list.contains(value: 2))
    }
    
    // MARK: - Remove Tests
    
    func testRemoveFromEmptyList() {
        let list = CircularList<Int>()
        
        XCTAssertThrowsError(try list.remove(value: 1)) { error in
            XCTAssertEqual(error as? CircularList<Int>.CircularListError, .valueNotFound)
        }
    }
    
    func testRemoveNonExistingValue() {
        let list = CircularList<Int>()
        list.append(value: 1)
        
        XCTAssertThrowsError(try list.remove(value: 2)) { error in
            XCTAssertEqual(error as? CircularList<Int>.CircularListError, .valueNotFound)
        }
    }
    
    func testRemoveExistingValue() {
        let list = CircularList<Int>()
        list.append(value: 1)
        list.append(value: 2)
        list.append(value: 3)
        
        try? list.remove(value: 2)
        
        XCTAssertTrue(list.contains(value: 1))
        XCTAssertFalse(list.contains(value: 2))
        XCTAssertTrue(list.contains(value: 3))
    }
    
    // MARK: - Contains Tests
    
    func testContainsEmptyList() {
        let list = CircularList<Int>()
        
        XCTAssertFalse(list.contains(value: 1))
    }
    
    func testContainsNonExistingValue() {
        let list = CircularList<Int>()
        list.append(value: 1)
        
        XCTAssertFalse(list.contains(value: 2))
    }
    
    func testContainsExistingValue() {
        let list = CircularList<Int>()
        list.append(value: 1)
        list.append(value: 2)
        list.append(value: 3)
        
        XCTAssertTrue(list.contains(value: 2))
    }
    
    // MARK: - CircularListError Tests
    
    func testCircularListErrorTitle() {
        XCTAssertEqual(CircularList<Int>.CircularListError.valueNotFound.title, "Value Not Found")
    }
    
    func testCircularListErrorDescription() {
        XCTAssertEqual(CircularList<Int>.CircularListError.valueNotFound.description, "The specified value was not found in the circular list.")
    }
}
