//
//  Solution725.swift
//  
//
//  Created by VassilyChi on 2021/9/22.
//

import Foundation

class Solution725 {
    func splitListToParts(_ head: ListNode?, _ k: Int) -> [ListNode?] {
        
        var nodeCount = 0
        var tmp = head
        var result: [ListNode?] = .init(repeating: nil, count: k)
        
        while tmp != nil {
            tmp = tmp?.next
            nodeCount += 1
        }
        
        tmp = head
        
        let qCount = nodeCount / k
        let remainder = nodeCount % k
        
        for i in 0..<k where tmp != nil {
            result[i] = tmp
            // 这里是精髓
            let subNodeCount = qCount + (i < remainder ? 1 : 0)
            for _ in 1..<subNodeCount {
                tmp = tmp?.next
            }
            
            let next = tmp?.next
            tmp?.next = nil
            tmp = next
        }
        
        return result
    }
}
