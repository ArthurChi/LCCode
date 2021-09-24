//
//  Solution860.swift
//  
//
//  Created by VassilyChi on 2021/9/24.
//

import Foundation

class Solution860 {
    func lemonadeChange(_ bills: [Int]) -> Bool {
        var changeCount5 = 0
        var changeCount10 = 0
        
        for bill in bills {
            switch bill {
            case 5:
                changeCount5 += 1
            case 10:
                changeCount5 -= 1
                changeCount10 += 1
            case 20:
                if changeCount10 > 0 {
                    changeCount10 -= 1
                    changeCount5 -= 1
                } else {
                    changeCount5 -= 3
                }
            default:
                fatalError()
            }
            
            if changeCount5 < 0 { return false }
        }
        
        return true
    }
}
