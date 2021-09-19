//
//  Solution2.swift
//  LCCode
//
//  Created by VassilyChi on 2021/9/19.
//

import Foundation

// https://leetcode-cn.com/problems/add-two-numbers/

class Solution2 {
    private var d = 0
    
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        let dummy = ListNode()
        
        var cur: ListNode? = dummy
        var l1P = l1
        var l2P = l2
        
        // 全不为空
        // 进位不为空
        // 单个不为空
        
        while let p1 = l1P, let p2 = l2P {
            cur?.next = addNode(p1, p2)
            
            cur = cur?.next
            l1P = l1P?.next
            l2P = l2P?.next
        }
        
        while let p1 = l1P {
            cur?.next = addNode(p1)
            
            cur = cur?.next
            l1P = l1P?.next
        }
        
        while let p2 = l2P {
            cur?.next = addNode(p2)
            cur = cur?.next
            l2P = l2P?.next
        }
        
        while d != 0 {
            let value = d % 10
            d = d / 10
            
            cur?.next = ListNode(value)
            cur = cur?.next
        }
        
        return dummy.next
    }
    
    private func addNode(_ p1: ListNode, _ p2: ListNode) -> ListNode {
        var value = p1.val + p2.val + d
        d = value / 10
        value = value % 10
        
        return ListNode(value)
    }
    
    private func addNode(_ p1: ListNode) -> ListNode {
        var value = p1.val + d
        
        d = value / 10
        value = value % 10
        
        return ListNode(value)
    }
}
