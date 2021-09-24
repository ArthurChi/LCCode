//
//  QueueTests.swift
//  
//
//  Created by VassilyChi on 2021/9/24.
//

import XCTest
@testable import LCCode

final class QueueTests: XCTestCase {
    func testLemonadeChange() {
        let solution = Solution860()
        assert(solution.lemonadeChange([5,5,5,5,20,20,5,5,20,5]) == false)
        assert(solution.lemonadeChange([5,5,5,10,20]) == true)
    }
}
