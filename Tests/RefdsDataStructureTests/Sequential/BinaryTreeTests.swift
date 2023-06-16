import XCTest
import RefdsDataStructure

class BinaryTreeTests: XCTestCase {

    // MARK: - Initialization Tests
    
    func testInitEmptyTree() {
        let tree = BinaryTree<Int>()
        XCTAssertTrue(tree.root == nil)
    }
    
    func testInitWithRootValue() {
        let tree = BinaryTree(value: 10)
        XCTAssertNotNil(tree.root)
        XCTAssertEqual(tree.root?.value, 10)
    }
    
    // MARK: - Insert Tests
    
    func testInsertSingleValue() {
        let tree = BinaryTree<Int>()
        tree.insert(10)
        
        XCTAssertNotNil(tree.root)
        XCTAssertEqual(tree.root?.value, 10)
        XCTAssertNil(tree.root?.left)
        XCTAssertNil(tree.root?.right)
    }
    
    func testInsertMultipleValues() {
        let tree = BinaryTree<Int>()
        
        tree.insert(10)
        tree.insert(5)
        tree.insert(15)
        tree.insert(3)
        tree.insert(8)
        
        XCTAssertNotNil(tree.root)
        XCTAssertEqual(tree.root?.value, 10)
        
        XCTAssertNotNil(tree.root?.left)
        XCTAssertEqual(tree.root?.left?.value, 5)
        
        XCTAssertNotNil(tree.root?.right)
        XCTAssertEqual(tree.root?.right?.value, 15)
        
        XCTAssertNotNil(tree.root?.left?.left)
        XCTAssertEqual(tree.root?.left?.left?.value, 3)
        
        XCTAssertNotNil(tree.root?.left?.right)
        XCTAssertEqual(tree.root?.left?.right?.value, 8)
    }
    
    // MARK: - Contains Tests
    
    func testContains() {
        let tree = BinaryTree<Int>()
        
        tree.insert(10)
        tree.insert(5)
        tree.insert(15)
        tree.insert(3)
        tree.insert(8)
        
        XCTAssertTrue(tree.contains(10))
        XCTAssertTrue(tree.contains(5))
        XCTAssertTrue(tree.contains(15))
        XCTAssertTrue(tree.contains(3))
        XCTAssertTrue(tree.contains(8))
        XCTAssertFalse(tree.contains(20))
    }
    
    // MARK: - Pre-Order Traversal Tests
    
    func testPreOrderTraversal() {
        let tree = BinaryTree<Int>()
        
        tree.insert(10)
        tree.insert(5)
        tree.insert(15)
        tree.insert(3)
        tree.insert(8)
        
        let elements = tree.preOrderTraversal()
        XCTAssertEqual(elements, [10, 5, 3, 8, 15])
    }
    
    // MARK: - In-Order Traversal Tests
    
    func testInOrderTraversal() {
        let tree = BinaryTree<Int>()
        
        tree.insert(10)
        tree.insert(5)
        tree.insert(15)
        tree.insert(3)
        tree.insert(8)
        
        let elements = tree.inOrderTraversal()
        XCTAssertEqual(elements, [3, 5, 8, 10, 15])
    }
    
    // MARK: - Post-Order Traversal Tests
    
    func testPostOrderTraversal() {
        let tree = BinaryTree<Int>()
        
        tree.insert(10)
        tree.insert(5)
        tree.insert(15)
        tree.insert(3)
        tree.insert(8)
        
        let elements = tree.postOrderTraversal()
        XCTAssertEqual(elements, [3, 8, 5, 15, 10])
    }
    
    // MARK: - BinaryTreeError Tests
    
    func testBinaryTreeErrorTitle() {
        XCTAssertEqual(BinaryTree<Int>.BinaryTreeError.invalidOperation.title, "Invalid Operation")
    }
    
    func testBinaryTreeErrorDescription() {
        XCTAssertEqual(BinaryTree<Int>.BinaryTreeError.invalidOperation.description, "The operation is not supported on the binary tree.")
    }

}
