//
//  Solution21.swift
//  
//
//  Created by VassilyChi on 2021/9/19.
//

//https://leetcode-cn.com/problems/merge-two-sorted-lists/

import Foundation

/*
 这道题有递归和迭代两种
 */

class Solution21 {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        recursion(l1, l2)
    }
    
    /// 递归版本
    private func recursion(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard let p1 = l1 else { return l2 }
        guard let p2 = l2 else { return l1 }
        
        if p1.val < p2.val {
            p1.next = recursion(p1.next, p2)
            return p1
        } else {
            p2.next = recursion(p1, p2.next)
            return p2
        }
    }
    
    /// 迭代版本
    private func iteration(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let dummy = ListNode()
        
        var cur: ListNode? = dummy
        var p1: ListNode? = l1
        var p2: ListNode? = l2
        
        while let vaild1 = p1, let vaild2 = p2 {
            if vaild1.val <= vaild2.val {
                cur?.next = ListNode(vaild1.val)
                p1 = p1?.next
            } else {
                cur?.next = ListNode(vaild2.val)
                p2 = p2?.next
            }
            
            cur = cur?.next
        }
        
        if p1 != nil {
            cur?.next = p1
        }
        
        if p2 != nil {
            cur?.next = p2
        }
        
        return dummy.next
    }
}
