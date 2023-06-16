import XCTest
import RefdsDataStructure

class OctreeTests: XCTestCase {
    func testInsertionAndSearch() throws {
        let boundingBox = Octree<Double>.BoundingBox(minX: 0, minY: 0, minZ: 0, maxX: 10, maxY: 10, maxZ: 10)
        let octree = Octree<Double>(boundingBox: boundingBox)
        
        try octree.insert(1.0, at: Octree<Double>.Point(x: 5, y: 5, z: 5))
        
        XCTAssertEqual(try octree.search(at: Octree<Double>.Point(x: 5, y: 5, z: 5)), 1.0)
        
        XCTAssertThrowsError(try octree.insert(4.0, at: Octree<Double>.Point(x: 11, y: 11, z: 11))) { error in
            XCTAssertEqual(error as? Octree<Double>.OctreeError, Octree<Double>.OctreeError.outOfBounds)
            XCTAssertEqual((error as? Octree<Double>.OctreeError)?.title, "Out of Bounds")
            XCTAssertEqual((error as? Octree<Double>.OctreeError)?.description, "The point is out of the Octree's bounds.")
        }
        
        XCTAssertThrowsError(try octree.search(at: Octree<Double>.Point(x: 11, y: 11, z: 11))) { error in
            XCTAssertEqual(error as? Octree<Double>.OctreeError, Octree<Double>.OctreeError.outOfBounds)
            XCTAssertEqual((error as? Octree<Double>.OctreeError)?.title, "Out of Bounds")
            XCTAssertEqual((error as? Octree<Double>.OctreeError)?.description, "The point is out of the Octree's bounds.")
        }
    }
    
    func testInvalidOctantError() throws {
        let boundingBox = Octree<String>.BoundingBox(minX: -10, minY: -10, minZ: -10, maxX: 10, maxY: 10, maxZ: 10)
        let octree = Octree<String>(boundingBox: boundingBox)
        
        try octree.insert("A", at: Octree<String>.Point(x: 0, y: 0, z: 0))
        
        XCTAssertThrowsError(try octree.insert("B", at: Octree<String>.Point(x: -5, y: -5, z: -5))) { error in
            XCTAssertEqual(error as? Octree<String>.OctreeError, Octree<String>.OctreeError.invalidOctant)
            XCTAssertEqual((error as? Octree<String>.OctreeError)?.title, "Invalid Octant")
            XCTAssertEqual((error as? Octree<String>.OctreeError)?.description, "The octant is invalid.")
        }
    }
}
