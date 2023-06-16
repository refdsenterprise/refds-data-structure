import XCTest
import RefdsDataStructure

class SegmentTreeTests: XCTestCase {
    func testSegmentTree() {
        // Test buildTree
        let values = [1, 3, 5, 7, 9, 11]
        let defaultValue = 0
        let merge: (Int, Int) -> Int = { $0 + $1 }
        
        guard let tree = try? SegmentTree(values, defaultValue: defaultValue, merge: merge) else {
            XCTFail("Failed to build Segment Tree")
            return
        }
        
        XCTAssertEqual(tree.tree, [36, 9, 27, 4, 5, 16, 11, 1, 3, 0, 0, 7, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
        
        // Test update
        do {
            try tree.update(2, at: 2)
            XCTAssertEqual(tree.tree, [33, 6, 27, 4, 2, 16, 11, 1, 3, 0, 0, 7, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
        } catch {
            XCTFail("Failed to update value: \(error)")
        }
        
        // Test query
        do {
            let result = try tree.query(rangeLeft: 1, rangeRight: 4)
            XCTAssertEqual(result, 21)
        } catch {
            XCTFail("Failed to query range: \(error)")
        }
    }
    
    func testEmptyArray() {
        let values: [Int] = []
        let defaultValue = 0
        let merge: (Int, Int) -> Int = { $0 + $1 }
        
        XCTAssertThrowsError(try SegmentTree(values, defaultValue: defaultValue, merge: merge)) { error in
            XCTAssertEqual(error as? SegmentTree<Int>.SegmentTreeError, .emptyArray)
        }
    }
    
    func testInvalidIndex() {
        let values = [1, 2, 3]
        let defaultValue = 0
        let merge: (Int, Int) -> Int = { $0 + $1 }
        let tree = try! SegmentTree(values, defaultValue: defaultValue, merge: merge)
        
        XCTAssertThrowsError(try tree.update(4, at: -1)) { error in
            XCTAssertEqual(error as? SegmentTree<Int>.SegmentTreeError, .invalidIndex)
        }
        
        XCTAssertThrowsError(try tree.update(4, at: 3)) { error in
            XCTAssertEqual(error as? SegmentTree<Int>.SegmentTreeError, .invalidIndex)
        }
        
        XCTAssertThrowsError(try tree.query(rangeLeft: -1, rangeRight: 2)) { error in
            XCTAssertEqual(error as? SegmentTree<Int>.SegmentTreeError, .invalidRange)
        }
        
        XCTAssertThrowsError(try tree.query(rangeLeft: 1, rangeRight: 5)) { error in
            XCTAssertEqual(error as? SegmentTree<Int>.SegmentTreeError, .invalidRange)
        }
    }
}
