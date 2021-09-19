//
//  Solution2.swift
//  LCCode
//
//  Created by VassilyChi on 2021/9/19.
//

import Foundation

// https://leetcode-cn.com/problems/add-two-numbers/

class Solution2 {
    
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var carry = 0
        let dummy = ListNode()
        
        var p1 = l1
        var p2 = l2
        var cur: ListNode? = dummy
        
        while p1 != nil || p2 != nil {
            let val1 = p1?.val ?? 0
            let val2 = p2?.val ?? 0
            
            let sum = val1 + val2 + carry
            carry = sum / 10
            
            cur?.next = ListNode(sum % 10)
            cur = cur?.next
            
            p1 = p1?.next
            p2 = p2?.next
        }
        
        if carry != 0 {
            cur?.next = ListNode(carry)
        }
        
        return dummy.next
    }
}
