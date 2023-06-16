import XCTest
import RefdsDataStructure

class QueueTests: XCTestCase {

    // MARK: - Initialization Tests
    
    func testInit() {
        let queue = Queue<Int>()
        XCTAssertTrue(queue.isEmpty)
        XCTAssertEqual(queue.count, 0)
    }
    
    // MARK: - Enqueue Tests
    
    func testEnqueue() {
        let queue = Queue<Int>()
        
        queue.enqueue(1)
        queue.enqueue(2)
        queue.enqueue(3)
        
        XCTAssertFalse(queue.isEmpty)
        XCTAssertEqual(queue.count, 3)
    }
    
    // MARK: - Dequeue Tests
    
    func testDequeueFromEmptyQueue() {
        let queue = Queue<Int>()
        
        XCTAssertThrowsError(try queue.dequeue()) { error in
            XCTAssertEqual(error as? Queue<Int>.QueueError, .queueIsEmpty)
        }
    }
    
    func testDequeue() {
        let queue = Queue<Int>()
        
        queue.enqueue(1)
        queue.enqueue(2)
        queue.enqueue(3)
        
        XCTAssertEqual(try? queue.dequeue(), 1)
        XCTAssertEqual(try? queue.dequeue(), 2)
        XCTAssertEqual(try? queue.dequeue(), 3)
        XCTAssertTrue(queue.isEmpty)
        XCTAssertEqual(queue.count, 0)
    }
    
    // MARK: - Peek Tests
    
    func testPeekEmptyQueue() {
        let queue = Queue<Int>()
        
        XCTAssertThrowsError(try queue.peek()) { error in
            XCTAssertEqual(error as? Queue<Int>.QueueError, .queueIsEmpty)
        }
    }
    
    func testPeek() {
        let queue = Queue<Int>()
        
        queue.enqueue(1)
        queue.enqueue(2)
        queue.enqueue(3)
        
        XCTAssertEqual(try? queue.peek(), 1)
        XCTAssertEqual(queue.count, 3)
    }
    
    // MARK: - QueueError Tests
    
    func testQueueErrorTitle() {
        XCTAssertEqual(Queue<Int>.QueueError.queueIsEmpty.title, "Queue Is Empty")
    }
    
    func testQueueErrorDescription() {
        XCTAssertEqual(Queue<Int>.QueueError.queueIsEmpty.description, "The queue is currently empty.")
    }
    
}
