import XCTest
import RefdsDataStructure

class StackTests: XCTestCase {

    // MARK: - Initialization Tests
    
    func testInit() {
        let stack = Stack<Int>()
        XCTAssertTrue(stack.isEmpty)
        XCTAssertEqual(stack.count, 0)
    }
    
    // MARK: - Push Tests
    
    func testPush() {
        let stack = Stack<Int>()
        
        stack.push(1)
        stack.push(2)
        stack.push(3)
        
        XCTAssertFalse(stack.isEmpty)
        XCTAssertEqual(stack.count, 3)
    }
    
    // MARK: - Pop Tests
    
    func testPopFromEmptyStack() {
        let stack = Stack<Int>()
        
        XCTAssertNil(stack.pop())
    }
    
    func testPop() {
        let stack = Stack<Int>()
        
        stack.push(1)
        stack.push(2)
        stack.push(3)
        
        XCTAssertEqual(stack.pop(), 3)
        XCTAssertEqual(stack.pop(), 2)
        XCTAssertEqual(stack.pop(), 1)
        XCTAssertTrue(stack.isEmpty)
        XCTAssertEqual(stack.count, 0)
    }
    
    // MARK: - Peek Tests
    
    func testPeekEmptyStack() {
        let stack = Stack<Int>()
        
        XCTAssertNil(stack.peek())
    }
    
    func testPeek() {
        let stack = Stack<Int>()
        
        stack.push(1)
        stack.push(2)
        stack.push(3)
        
        XCTAssertEqual(stack.peek(), 3)
        XCTAssertEqual(stack.count, 3)
    }
    
    // MARK: - Search Tests
    
    func testSearchElementFound() {
        let stack = Stack<Int>()
        
        stack.push(1)
        stack.push(2)
        stack.push(3)
        
        XCTAssertEqual(try? stack.search(2), 1)
    }
    
    func testSearchElementNotFound() {
        let stack = Stack<Int>()
        
        stack.push(1)
        stack.push(2)
        stack.push(3)
        
        XCTAssertThrowsError(try stack.search(4)) { error in
            XCTAssertEqual(error as? Stack<Int>.StackError, .elementNotFound)
        }
    }
    
    // MARK: - StackError Tests
    
    func testStackErrorTitle() {
        XCTAssertEqual(Stack<Int>.StackError.elementNotFound.title, "Element Not Found")
    }
    
    func testStackErrorDescription() {
        XCTAssertEqual(Stack<Int>.StackError.elementNotFound.description, "The specified element was not found in the stack.")
    }
    
}
