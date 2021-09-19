//
//  Solution24.swift
//  
//
//  Created by VassilyChi on 2021/9/19.
//

import Foundation

//https://leetcode-cn.com/problems/swap-nodes-in-pairs/
// 递归和迭代两个版本

class Solution24 {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        guard head?.next != nil else { return head }
        
        let dummy = ListNode()
        dummy.next = head
        
        var pre: ListNode? = dummy
        
        // 这里需要注意判断条件, 能配对的才能进入这块逻辑, 单蹦的不得行
        while pre != nil && pre?.next?.next != nil {
            let first: ListNode? = pre?.next
            let second: ListNode? = pre?.next?.next
            
            pre?.next = second
            first?.next = second?.next
            second?.next = first
            
            pre = first
        }
        
        return dummy.next
    }
}
