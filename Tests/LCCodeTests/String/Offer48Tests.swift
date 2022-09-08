//
//  Offer48Tests.swift
//  
//
//  Created by ByteDance on 2022/9/8.
//

import XCTest
@testable import LCCode

class Offer48Tests: XCTestCase {
    
    private let obj = SolutionOffer48()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testStrings() {
        let result = obj.lengthOfLongestSubstring("abcabcbb")
        
        assert(result == 3, "\(result)")
    }
    
    func testOneChars() {
        
        let result = obj.lengthOfLongestSubstring("bbbbb")
        
        assert(result == 1, "\(result)")
    }
    
    func testSubString() {
        let result = obj.lengthOfLongestSubstring("pwwkew")
        
        assert(result == 3, "\(result)")
    }

}
