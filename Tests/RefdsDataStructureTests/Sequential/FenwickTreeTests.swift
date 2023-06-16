import XCTest
import RefdsDataStructure

class FenwickTreeTests: XCTestCase {
    func testBuildingTree() throws {
        let values = [1, 2, 3, 4, 5]
        let fenwickTree = try FenwickTree(values)
        
        XCTAssertEqual(try fenwickTree.prefixSum(upTo: 0), 1)
        XCTAssertEqual(try fenwickTree.prefixSum(upTo: 1), 3)
        XCTAssertEqual(try fenwickTree.prefixSum(upTo: 2), 6)
        XCTAssertEqual(try fenwickTree.prefixSum(upTo: 3), 10)
        XCTAssertEqual(try fenwickTree.prefixSum(upTo: 4), 15)
        
        XCTAssertThrowsError(try fenwickTree.prefixSum(upTo: -1)) { error in
            XCTAssertEqual(error as? FenwickTree<Int>.FenwickTreeError, FenwickTree<Int>.FenwickTreeError.invalidIndex)
            XCTAssertEqual((error as? FenwickTree<Int>.FenwickTreeError)?.title, "Invalid Index")
            XCTAssertEqual((error as? FenwickTree<Int>.FenwickTreeError)?.description, "The index is invalid.")
        }
        
        XCTAssertThrowsError(try fenwickTree.prefixSum(upTo: 10)) { error in
            XCTAssertEqual(error as? FenwickTree<Int>.FenwickTreeError, FenwickTree<Int>.FenwickTreeError.invalidIndex)
            XCTAssertEqual((error as? FenwickTree<Int>.FenwickTreeError)?.title, "Invalid Index")
            XCTAssertEqual((error as? FenwickTree<Int>.FenwickTreeError)?.description, "The index is invalid.")
        }
    }
    
    func testUpdatingValues() throws {
        let values = [1, 2, 3, 4, 5]
        let fenwickTree = try FenwickTree(values)
        
        try fenwickTree.update(10, at: 2)
        
        XCTAssertEqual(try fenwickTree.prefixSum(upTo: 0), 1)
        XCTAssertEqual(try fenwickTree.prefixSum(upTo: 1), 3)
        XCTAssertEqual(try fenwickTree.prefixSum(upTo: 2), 16)
        XCTAssertEqual(try fenwickTree.prefixSum(upTo: 3), 20)
        XCTAssertEqual(try fenwickTree.prefixSum(upTo: 4), 25)
        
        XCTAssertThrowsError(try fenwickTree.update(7, at: -1)) { error in
            XCTAssertEqual(error as? FenwickTree<Int>.FenwickTreeError, FenwickTree<Int>.FenwickTreeError.invalidIndex)
            XCTAssertEqual((error as? FenwickTree<Int>.FenwickTreeError)?.title, "Invalid Index")
            XCTAssertEqual((error as? FenwickTree<Int>.FenwickTreeError)?.description, "The index is invalid.")
        }
        
        XCTAssertThrowsError(try fenwickTree.update(7, at: 10)) { error in
            XCTAssertEqual(error as? FenwickTree<Int>.FenwickTreeError, FenwickTree<Int>.FenwickTreeError.invalidIndex)
            XCTAssertEqual((error as? FenwickTree<Int>.FenwickTreeError)?.title, "Invalid Index")
            XCTAssertEqual((error as? FenwickTree<Int>.FenwickTreeError)?.description, "The index is invalid.")
        }
    }
    
    func testEmptyArrayError() {
        XCTAssertThrowsError(try FenwickTree<Int>([])) { error in
            XCTAssertEqual(error as? FenwickTree<Int>.FenwickTreeError, FenwickTree<Int>.FenwickTreeError.emptyArray)
            XCTAssertEqual((error as? FenwickTree<Int>.FenwickTreeError)?.title, "Empty Array")
            XCTAssertEqual((error as? FenwickTree<Int>.FenwickTreeError)?.description, "The array is empty.")
        }
    }
}
