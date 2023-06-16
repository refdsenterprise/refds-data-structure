import XCTest
import RefdsDataStructure

class QuadtreeTests: XCTestCase {
    func testInsertionAndSearch() throws {
        let boundingBox = Quadtree<Double>.BoundingBox(minX: 0, minY: 0, maxX: 10, maxY: 10)
        let quadtree = Quadtree<Double>(boundingBox: boundingBox)
        
        try quadtree.insert(1.0, at: Quadtree<Double>.Point(x: 5, y: 5))
        
        XCTAssertEqual(try quadtree.search(at: Quadtree<Double>.Point(x: 5, y: 5)), 1.0)
        
        XCTAssertThrowsError(try quadtree.insert(4.0, at: Quadtree<Double>.Point(x: 11, y: 11))) { error in
            XCTAssertEqual(error as? Quadtree<Double>.QuadtreeError, Quadtree<Double>.QuadtreeError.outOfBounds)
            XCTAssertEqual((error as? Quadtree<Double>.QuadtreeError)?.title, "Out of Bounds")
            XCTAssertEqual((error as? Quadtree<Double>.QuadtreeError)?.description, "The point is out of the Quadtree's bounds.")
        }
        
        XCTAssertThrowsError(try quadtree.search(at: Quadtree<Double>.Point(x: 11, y: 11))) { error in
            XCTAssertEqual(error as? Quadtree<Double>.QuadtreeError, Quadtree<Double>.QuadtreeError.outOfBounds)
            XCTAssertEqual((error as? Quadtree<Double>.QuadtreeError)?.title, "Out of Bounds")
            XCTAssertEqual((error as? Quadtree<Double>.QuadtreeError)?.description, "The point is out of the Quadtree's bounds.")
        }
    }
    
    func testInvalidQuadrantError() throws {
        let boundingBox = Quadtree<String>.BoundingBox(minX: -10, minY: -10, maxX: 10, maxY: 10)
        let quadtree = Quadtree<String>(boundingBox: boundingBox)
        
        try quadtree.insert("A", at: Quadtree<String>.Point(x: 0, y: 0))
        
        XCTAssertThrowsError(try quadtree.insert("B", at: Quadtree<String>.Point(x: -5, y: -5))) { error in
            XCTAssertEqual(error as? Quadtree<String>.QuadtreeError, Quadtree<String>.QuadtreeError.invalidQuadrant)
            XCTAssertEqual((error as? Quadtree<String>.QuadtreeError)?.title, "Invalid Quadrant")
            XCTAssertEqual((error as? Quadtree<String>.QuadtreeError)?.description, "The quadrant is invalid.")
        }
    }
}
