//
//  Solution482.swift
//  
//
//  Created by VassilyChi on 2021/10/4.
//

import Foundation

class Solution482 {
    func licenseKeyFormatting(_ s: String, _ k: Int) -> String {
        
        var result = [String]()
        var count = 0
        
        // 这道题操作字符串
        for i in s.indices.reversed() {
            if s[i] != "-" {
                count += 1
                result.insert(s[i].uppercased(), at: 0)
                
                if count % k == 0 {
                    result.insert("-", at: 0)
                }
            }
        }
        
        if !result.isEmpty && result[result.startIndex] == "-" {
            result.remove(at: result.startIndex)
        }
        
        return result.joined()
    }
}
