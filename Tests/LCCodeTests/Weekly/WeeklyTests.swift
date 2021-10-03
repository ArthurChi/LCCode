//
//  WeeklyTests.swift
//  
//
//  Created by VassilyChi on 2021/9/26.
//

import XCTest
@testable import LCCode

final class WeeklyTests: XCTestCase {
    
    func testMaximumDifference() {
        let s = Solution5881()
        let result = s.maximumDifference([7,1,5,4])
        assert(result == 4, "\(result)")
        let result1 = s.maximumDifference([9,4,3,2])
        assert(result1 == -1, "\(result1)")
        let result2 = s.maximumDifference([1,5,2,10])
        assert(result2 == 9)
    }
    
    func testFractionToDecimal() {
        let s = Solution166()
//        let result = s.fractionToDecimal(1, 2)
//        assert(result == "0.5")
//        
//        let result1 = s.fractionToDecimal(2, 3)
//        assert(result1 == "0.(6)")
        
        let result2 = s.fractionToDecimal(7, -12)
        assert(result2 == "-0.58(3)")
    }
}
