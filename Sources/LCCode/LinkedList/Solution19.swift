//
//  Solution19.swift
//  
//
//  Created by VassilyChi on 2021/9/19.
//

// https://leetcode-cn.com/problems/remove-nth-node-from-end-of-list/

import Foundation

class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        
        var count = 0
        var cur = head
        
        while cur != nil {
            cur = cur?.next
            count += 1
        }
        
        if n == count {
            return head?.next
        }
        
        cur = head
        for _ in 0..<count - n - 1 {
            cur = cur?.next
        }
        
        cur?.next = cur?.next?.next
        
        return head
    }
}
