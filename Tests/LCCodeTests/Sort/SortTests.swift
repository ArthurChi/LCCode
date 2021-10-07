//
//  SortTests.swift
//  
//
//  Created by VassilyChi on 2021/10/5.
//

import XCTest
@testable import LCCode

final class SortTests: XCTestCase {
    
    let e = SortHelper.generateRandom(count: 10)
    let e_1000_sorted = SortHelper.generateRandom(count: 1000).sorted(by: <)
    
    func testBubbleSort() {
        let result = e.bubbleSort(<)
        assert(result == e.sorted(by: <), result.description)
        assert(e.bubbleSort(>) == e.sorted(by: >))
    }
    
    func testBubbleSortV1() {
        let result = e.bubbleSortV1(<)
        assert(result == e.sorted(by: <), result.description)
        assert(e.bubbleSortV1(>) == e.sorted(by: >))
    }
    
    func testBubbleSortV2() {
        let result = e.bubbleSortV2(<)
        assert(result == e.sorted(by: <), result.description)
        assert(e.bubbleSortV2(>) == e.sorted(by: >))
    }
    
    func testPerformanceOfBubbleSort() {
        measure {
            let _ = e_1000_sorted.bubbleSort(<)
        }
    }
    
    func testPerformanceOfBubbleSortV1() {
        measure {
            let _ = e_1000_sorted.bubbleSortV1(<)
        }
    }
    
    func testPerformanceOfBubbleSortV2() {
        measure {
            let _ = e_1000_sorted.bubbleSortV2(<)
        }
    }
    
    func testSelectionSort() {
        let result = e.selectionSort(<)
        assert(result == e.sorted(by: <), result.description)
        assert(e.selectionSort(>) == e.sorted(by: >))
    }
    
    func testHeapSort() {
        let data = [99, 98, 70, 79, 87, 2, 14, 78, 58, 82]
        let result = data.heapSort(<)
        assert(result == data.sorted(by: <), result.description)
        assert(e.heapSort(>) == e.sorted(by: >))
    }
}
