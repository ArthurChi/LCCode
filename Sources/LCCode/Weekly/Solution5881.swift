//
//  Solution5881.swift
//  
//
//  Created by VassilyChi on 2021/9/26.
//

import Foundation

class Solution5881 {
    func maximumDifference(_ nums: [Int]) -> Int {
        var result = -1
        var min: Int = nums[0]
        
        for index in 1..<nums.count {
            let current = nums[index]
            if min < current {
                result = max(current - min, result)
            }
            
            if min > current {
                min = nums[index]
            }
        }
        
        return result
    }
}
