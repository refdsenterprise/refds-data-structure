import XCTest
import RefdsDataStructure

class AVLTreeTests: XCTestCase {

    // MARK: - Initialization Tests
    
    func testInitEmptyTree() {
        let tree = AVLTree<Int>()
        XCTAssertTrue(tree.root == nil)
    }
    
    func testInitWithRootValue() {
        let tree = AVLTree(value: 10)
        XCTAssertNotNil(tree.root)
        XCTAssertEqual(tree.root?.value, 10)
    }
    
    // MARK: - Insert Tests
    
    func testInsertSingleValue() {
        let tree = AVLTree<Int>()
        tree.insert(10)
        
        XCTAssertNotNil(tree.root)
        XCTAssertEqual(tree.root?.value, 10)
        XCTAssertNil(tree.root?.left)
        XCTAssertNil(tree.root?.right)
    }
    
    func testInsertMultipleValues() {
        let tree = AVLTree<Int>()
        
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
    
    // MARK: - Rotate Right Tests
    
    func testRotateRight() {
        let tree = AVLTree<Int>()
        
        tree.insert(10)
        tree.insert(5)
        tree.insert(15)
        tree.insert(3)
        tree.insert(8)
        
        let newRoot = tree.rotateRight(tree.root!)
        
        XCTAssertNotNil(newRoot)
        XCTAssertEqual(newRoot.value, 5)
        
        XCTAssertNotNil(newRoot.left)
        XCTAssertEqual(newRoot.left?.value, 3)
        
        XCTAssertNotNil(newRoot.right)
        XCTAssertEqual(newRoot.right?.value, 10)
        
        XCTAssertNotNil(newRoot.right?.left)
        XCTAssertEqual(newRoot.right?.left?.value, 8)
        
        XCTAssertNotNil(newRoot.right?.right)
        XCTAssertEqual(newRoot.right?.right?.value, 15)
    }
    
    // MARK: - Rotate Left Tests
    
    func testRotateLeft() {
        let tree = AVLTree<Int>()
        
        tree.insert(10)
        tree.insert(5)
        tree.insert(15)
        tree.insert(12)
        tree.insert(20)
        
        let newRoot = tree.rotateLeft(tree.root!)
        
        XCTAssertNotNil(newRoot)
        XCTAssertEqual(newRoot.value, 15)
        
        XCTAssertNotNil(newRoot.left)
        XCTAssertEqual(newRoot.left?.value, 10)
        
        XCTAssertNotNil(newRoot.left?.left)
        XCTAssertEqual(newRoot.left?.left?.value, 5)
        
        XCTAssertNotNil(newRoot.right)
        XCTAssertEqual(newRoot.right?.value, 20)
        
        XCTAssertNil(newRoot.right?.left)
        XCTAssertNil(newRoot.right?.left?.value)
    }
    
    // MARK: - Balance Factor Tests
    
    func testGetBalanceFactor() {
        let tree = AVLTree<Int>()
        
        tree.insert(10)
        tree.insert(5)
        tree.insert(15)
        
        XCTAssertEqual(tree.getBalanceFactor(tree.root), 0)
        XCTAssertEqual(tree.getBalanceFactor(tree.root?.left), 0)
        XCTAssertEqual(tree.getBalanceFactor(tree.root?.right), 0)
    }
    
    // MARK: - Height Tests
    
    func testGetHeight() {
        let tree = AVLTree<Int>()
        
        tree.insert(10)
        tree.insert(5)
        tree.insert(15)
        tree.insert(3)
        tree.insert(8)
        
        XCTAssertEqual(tree.height(tree.root), 3)
        XCTAssertEqual(tree.height(tree.root?.left), 2)
        XCTAssertEqual(tree.height(tree.root?.right), 1)
        XCTAssertEqual(tree.height(tree.root?.left?.left), 1)
        XCTAssertEqual(tree.height(tree.root?.left?.right), 1)
    }
    
    // MARK: - AVLTreeError Tests
    
    func testAVLTreeErrorTitle() {
        XCTAssertEqual(AVLTree<Int>.AVLTreeError.invalidOperation.title, "Invalid Operation")
    }
    
    func testAVLTreeErrorDescription() {
        XCTAssertEqual(AVLTree<Int>.AVLTreeError.invalidOperation.description, "The operation is not supported on the AVL tree.")
    }
    
}
