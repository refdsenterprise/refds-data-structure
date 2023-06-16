import XCTest
import RefdsDataStructure

//class BTreeTests: XCTestCase {
//    func testInsertion() {
//        let bTree = BTree<Int, String>(order: 3)
//        bTree.insert(5, value: "Value 5")
//        bTree.insert(10, value: "Value 10")
//        bTree.insert(1, value: "Value 1")
//        
//        XCTAssertEqual(bTree.root?.keys, [5])
//        XCTAssertEqual(bTree.root?.children.count, 2)
//        
//        XCTAssertEqual(bTree.root?.children[0].keys, [1])
//        XCTAssertTrue(bTree.root?.children[0].isLeaf ?? false)
//        
//        XCTAssertEqual(bTree.root?.children[1].keys, [10])
//        XCTAssertTrue(bTree.root?.children[1].isLeaf ?? false)
//    }
//    
//    func testSplitChild() {
//        let bTree = BTree<Int, String>(order: 3)
//        let node = BTree<Int, String>.Node()
//        node.keys = [1, 2, 3, 4, 5]
//        bTree.root = node
//        
//        bTree.splitChild(node, at: 0, parent: node)
//        
//        XCTAssertEqual(node.keys, [3])
//        XCTAssertEqual(node.children.count, 2)
//        
//        XCTAssertEqual(node.children[0].keys, [1, 2])
//        XCTAssertTrue(node.children[0].isLeaf)
//        
//        XCTAssertEqual(node.children[1].keys, [4, 5])
//        XCTAssertTrue(node.children[1].isLeaf)
//    }
//    
//    func testInsertionWithSplit() {
//        let bTree = BTree<Int, String>(order: 3)
//        bTree.insert(5, value: "Value 5")
//        bTree.insert(10, value: "Value 10")
//        bTree.insert(1, value: "Value 1")
//        bTree.insert(2, value: "Value 2")
//        bTree.insert(3, value: "Value 3")
//        
//        XCTAssertEqual(bTree.root?.keys, [2, 5])
//        XCTAssertEqual(bTree.root?.children.count, 3)
//        
//        XCTAssertEqual(bTree.root?.children[0].keys, [1])
//        XCTAssertTrue(bTree.root?.children[0].isLeaf ?? false)
//        
//        XCTAssertEqual(bTree.root?.children[1].keys, [3])
//        XCTAssertTrue(bTree.root?.children[1].isLeaf ?? false)
//        
//        XCTAssertEqual(bTree.root?.children[2].keys, [10])
//        XCTAssertTrue(bTree.root?.children[2].isLeaf ?? false)
//    }
//    
//    func testInvalidOperationError() {
//        XCTAssertThrowsError(try {
//            // Attempting an invalid operation
//            throw BTree<Int, String>.BTreeError.invalidOperation
//        }()) { error in
//            XCTAssertEqual(error as? BTree<Int, String>.BTreeError, BTree<Int, String>.BTreeError.invalidOperation)
//            XCTAssertEqual((error as? BTree<Int, String>.BTreeError)?.title, "Invalid Operation")
//            XCTAssertEqual((error as? BTree<Int, String>.BTreeError)?.description, "The operation is not supported on the B-Tree.")
//        }
//    }
//}
