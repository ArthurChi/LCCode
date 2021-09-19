//
//  Solution2Tests.swift
//  LCCodeTests
//
//  Created by VassilyChi on 2021/9/19.
//

import XCTest
@testable import LCCode

final class Solution2Tests: XCTestCase {
    
    func testAddTwoNumbers() {
        let solution = Solution2()

        let l1 = [9,9,9,9,9,9,9].listNodes
        let l2 = [9,9,9,9].listNodes
        let l3 = solution.addTwoNumbers(l1, l2)
        
        assert(l3!.equals([8,9,9,9,0,0,0,1]))
    }

    func testMergeKLists() {
        let solution = Solution23()
        assert(solution.mergeKLists([[1,4,5],[1,3,4],[2,6]].map { $0.listNodes })!.equals([1,1,2,3,4,4,5,6]))
    }
    
    func testSwapPairs() {
        let solution = Solution24()
        assert(solution.swapPairs([1,2,3,4].listNodes)!.equals([2,1,4,3]))
        assert(solution.swapPairs([1,2,3].listNodes)!.equals([2,1,3]))
    }
}