//
//  File.swift
//  
//
//  Created by VassilyChi on 2022/6/6.
//

import XCTest
@testable import LCCode

final class ArrayTests: XCTestCase {
    
    func test303() {
        let x = NumArray([-2, 0, 3, -5, 2, -1])
        assert(x.sumRange(0, 2) == 1, "\(x.sumRange(0, 2))")
        assert(x.sumRange(2, 5) == -1, "\(x.sumRange(2, 5))")
    }
}
