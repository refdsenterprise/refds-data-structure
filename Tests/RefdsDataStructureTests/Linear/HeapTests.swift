import XCTest
import RefdsDataStructure

class HeapTests: XCTestCase {

    // MARK: - Initialization Tests

    func testInit() {
        let heap = Heap<Int>()
        XCTAssertTrue(heap.isEmpty)
        XCTAssertEqual(heap.count, 0)
    }

    func testInitWithElements() {
        let elements = [5, 3, 8, 2, 7]

        do {
            let heap = try Heap(elements: elements)
            XCTAssertFalse(heap.isEmpty)
            XCTAssertEqual(heap.count, elements.count)

            let expectedSortedElements = elements.sorted()

            for _ in expectedSortedElements {
                guard let _ = try? heap.extractMin() else {
                    XCTFail("Failed to extract minimum element.")
                    return
                }
            }

            XCTAssertTrue(heap.isEmpty)
            XCTAssertEqual(heap.count, 0)
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }

    // MARK: - Insert Tests

    func testInsert() {
        let heap = Heap<Int>()

        heap.insert(5)
        heap.insert(3)
        heap.insert(8)
        heap.insert(2)
        heap.insert(7)

        XCTAssertFalse(heap.isEmpty)
        XCTAssertEqual(heap.count, 5)

        let expectedSortedElements = [2, 3, 5, 7, 8]

        for expectedElement in expectedSortedElements {
            guard let extractedElement = try? heap.extractMin() else {
                XCTFail("Failed to extract minimum element.")
                return
            }

            XCTAssertEqual(extractedElement, expectedElement)
        }

        XCTAssertTrue(heap.isEmpty)
        XCTAssertEqual(heap.count, 0)
    }

    // MARK: - ExtractMin Tests

    func testExtractMinFromEmptyHeap() {
        let heap = Heap<Int>()

        XCTAssertNil(try? heap.extractMin())
    }

    func testExtractMin() {
        let heap = Heap<Int>()
        heap.insert(5)
        heap.insert(3)
        heap.insert(8)
        heap.insert(2)
        heap.insert(7)

        XCTAssertEqual(try? heap.extractMin(), 2)
        XCTAssertEqual(try? heap.extractMin(), 3)
        XCTAssertEqual(try? heap.extractMin(), 5)
        XCTAssertEqual(try? heap.extractMin(), 7)
        XCTAssertEqual(try? heap.extractMin(), 8)
        XCTAssertNil(try? heap.extractMin())
    }

    // MARK: - Peek Tests

    func testPeekEmptyHeap() {
        let heap = Heap<Int>()

        XCTAssertNil(heap.peek())
    }

    func testPeek() {
        let heap = Heap<Int>()
        heap.insert(5)
        heap.insert(3)
        heap.insert(8)
        heap.insert(2)
        heap.insert(7)

        XCTAssertEqual(heap.peek(), 2)
    }

    // MARK: - HeapError Tests

    func testHeapErrorTitle() {
        XCTAssertEqual(Heap<Int>.HeapError.invalidHeap.title, "Invalid Heap")
    }

    func testHeapErrorDescription() {
        XCTAssertEqual(Heap<Int>.HeapError.invalidHeap.description, "The elements array does not form a valid heap.")
    }
}
