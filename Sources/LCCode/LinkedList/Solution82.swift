//
//  Solution82.swift
//  
//
//  Created by VassilyChi on 2021/9/22.
//

import Foundation

class Solution82 {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil { return head }
        
        let dummy: ListNode? = .init()
        dummy?.next = head
        var cur = dummy
        
        while cur?.next?.next != nil {
            if cur?.next?.val == cur?.next?.next?.val {
                let val = cur?.next?.val
                while cur?.next?.val == val {
                    cur?.next = cur?.next?.next
                }
            } else {
                cur = cur?.next
            }
        }
        
        return dummy?.next
    }
}
