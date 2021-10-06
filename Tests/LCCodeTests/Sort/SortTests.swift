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
    }
    
    func testBubbleSortV1() {
        let result = e.bubbleSortV1(<)
        assert(result == e.sorted(by: <), result.description)
    }
    
    func testBubbleSortV2() {
        let result = e.bubbleSortV2(<)
        assert(result == e.sorted(by: <), result.description)
    }
    
    func testPerformanceOfBubbleSort() {
        measure {
            e_1000_sorted.bubbleSort(<)
        }
    }
    
    func testPerformanceOfBubbleSortV1() {
        measure {
            e_1000_sorted.bubbleSortV1(<)
        }
    }
    
    func testPerformanceOfBubbleSortV2() {
        measure {
            e_1000_sorted.bubbleSortV2(<)
        }
    }
    
}
