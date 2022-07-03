//
//  File.swift
//  
//
//  Created by VassilyChi on 2022/6/6.
//

import Foundation

class NumArray {

    private var preNums: Array<Int>

    init(_ nums: [Int]) {
        preNums = Array<Int>(repeating: 0, count: nums.count + 1)

         for i in 1..<preNums.count {
             preNums[i] = preNums[i - 1] + nums[i - 1]
         }
    }
    
    func sumRange(_ left: Int, _ right: Int) -> Int {
        return preNums[right + 1] - preNums[left]
    }
}
