import XCTest
import RefdsDataStructure

class RedBlackTreeTests: XCTestCase {
    func testInsertionAndRotation() {
        let tree = RedBlackTree<Int, String>()

        tree.insert(10, value: "A")
        XCTAssertEqual(tree.root?.key, 10)
        XCTAssertEqual(tree.root?.value, "A")
        XCTAssertEqual(tree.root?.color, .black)

        tree.insert(5, value: "B")
        XCTAssertEqual(tree.root?.key, 10)
        XCTAssertEqual(tree.root?.left?.key, 5)
        XCTAssertEqual(tree.root?.left?.value, "B")
        XCTAssertEqual(tree.root?.left?.color, .red)

        tree.insert(15, value: "C")
        XCTAssertEqual(tree.root?.key, 10)
        XCTAssertEqual(tree.root?.left?.key, 5)
        XCTAssertEqual(tree.root?.left?.value, "B")
        XCTAssertEqual(tree.root?.left?.color, .red)
        XCTAssertEqual(tree.root?.right?.key, 15)
        XCTAssertEqual(tree.root?.right?.value, "C")
        XCTAssertEqual(tree.root?.right?.color, .red)

        tree.insert(3, value: "D")
        XCTAssertEqual(tree.root?.key, 10)
        XCTAssertEqual(tree.root?.left?.key, 5)
        XCTAssertEqual(tree.root?.left?.left?.key, 3)
        XCTAssertEqual(tree.root?.right?.key, 15)

        tree.insert(7, value: "E")
        XCTAssertEqual(tree.root?.key, 10)
        XCTAssertEqual(tree.root?.left?.key, 5)
        XCTAssertEqual(tree.root?.right?.key, 15)
    }

    func testInsertNode() {
        let tree = RedBlackTree<Int, String>()
        let node1 = RedBlackTree<Int, String>.Node(key: 10, value: "A", color: .red)
        tree.insertNode(node1, at: nil)
        XCTAssertEqual(tree.root?.value, nil)

        let node2 = RedBlackTree<Int, String>.Node(key: 5, value: "B", color: .red)
        tree.insertNode(node2, at: node1)
        XCTAssertEqual(node1.left?.value, node2.value)

        let node3 = RedBlackTree<Int, String>.Node(key: 15, value: "C", color: .red)
        tree.insertNode(node3, at: node1)
        XCTAssertEqual(node1.right?.value, node3.value)
    }

    func testFixViolationAfterInsertion() {
        let tree = RedBlackTree<Int, String>()

        // Case 1
        let node1 = RedBlackTree<Int, String>.Node(key: 10, value: "A", color: .red)
        let node2 = RedBlackTree<Int, String>.Node(key: 5, value: "B", color: .red)
        let node3 = RedBlackTree<Int, String>.Node(key: 15, value: "C", color: .red)
        let node4 = RedBlackTree<Int, String>.Node(key: 3, value: "D", color: .red)
        let node5 = RedBlackTree<Int, String>.Node(key: 7, value: "E", color: .red)
        tree.root = node1
        node1.left = node2
        node1.right = node3
        node2.left = node4
        node2.right = node5
        tree.fixViolationAfterInsertion(node5)
        XCTAssertEqual(tree.root?.color, .black)
        XCTAssertEqual(tree.root?.left?.color, .red)
        XCTAssertEqual(tree.root?.right?.color, .red)

        // Case 2
        let node6 = RedBlackTree<Int, String>.Node(key: 6, value: "F", color: .red)
        node2.right = node6
        tree.fixViolationAfterInsertion(node6)
        XCTAssertEqual(tree.root?.color, .black)
        XCTAssertEqual(tree.root?.left?.color, .red)
        XCTAssertEqual(tree.root?.right?.color, .red)
        XCTAssertEqual(tree.root?.left?.left?.color, .red)
        XCTAssertEqual(tree.root?.left?.right?.color, .red)

        // Case 3
        let node7 = RedBlackTree<Int, String>.Node(key: 11, value: "G", color: .red)
        node3.left = node7
        tree.fixViolationAfterInsertion(node7)
        XCTAssertEqual(tree.root?.color, .black)
        XCTAssertEqual(tree.root?.left?.color, .red)
        XCTAssertEqual(tree.root?.right?.color, .red)
        XCTAssertEqual(tree.root?.right?.left?.color, .red)

        // Case 4
        let node8 = RedBlackTree<Int, String>.Node(key: 13, value: "H", color: .red)
        node3.right = node8
        tree.fixViolationAfterInsertion(node8)
        XCTAssertEqual(tree.root?.color, .black)
        XCTAssertEqual(tree.root?.left?.color, .red)
        XCTAssertEqual(tree.root?.right?.color, .red)
        XCTAssertEqual(tree.root?.right?.left?.color, .red)
        XCTAssertEqual(tree.root?.right?.right?.color, .red)
    }

    func testRotation() {
        let tree = RedBlackTree<Int, String>()

        // Left Rotation
        let node1 = RedBlackTree<Int, String>.Node(key: 10, value: "A", color: .red)
        let node2 = RedBlackTree<Int, String>.Node(key: 5, value: "B", color: .red)
        let node3 = RedBlackTree<Int, String>.Node(key: 15, value: "C", color: .red)
        let node4 = RedBlackTree<Int, String>.Node(key: 3, value: "D", color: .red)
        tree.root = node1
        node1.left = node2
        node1.right = node3
        node2.left = node4
        tree.rotateLeft(node1)
        XCTAssertEqual(tree.root?.key, 15)
        XCTAssertEqual(tree.root?.left?.key, 10)
        XCTAssertEqual(tree.root?.right?.key, nil)
        XCTAssertEqual(tree.root?.left?.left?.key, 5)
        XCTAssertEqual(tree.root?.left?.right?.key, nil)
        XCTAssertEqual(tree.root?.left?.left?.left?.key, 3)

        // Right Rotation
        let node5 = RedBlackTree<Int, String>.Node(key: 7, value: "E", color: .red)
        node2.right = node5
        tree.rotateRight(node1)
        XCTAssertEqual(tree.root?.key, 15)
        XCTAssertEqual(tree.root?.left?.key, 5)
    }
}
