//
//  Offer48.swift
//  
//
//  Created by ByteDance on 2022/9/8.
//

import Foundation

class SolutionOffer48 {
    
    var maxValue: Int = 0
    
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var container = Set<Character>()
        
        var maxValue = 0
        
        if s.isEmpty { return maxValue }
        
        var left = s.startIndex
        var right = left
        
        while right < s.endIndex {
            if !container.contains(s[right]) {
                container.insert(s[right])
                maxValue += 1
                right = s.index(after: right)
                self.maxValue = max(maxValue, self.maxValue)
            } else {
                container.remove(s[left])
                maxValue -= 1
                left = s.index(after: left)
            }
        }
        
        return self.maxValue
    }
    
    
}
