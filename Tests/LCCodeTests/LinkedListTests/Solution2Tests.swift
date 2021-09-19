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

}
