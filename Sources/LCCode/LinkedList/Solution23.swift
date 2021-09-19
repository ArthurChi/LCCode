//
//  Solution23.swift
//  
//
//  Created by VassilyChi on 2021/9/19.
//

import Foundation

//https://leetcode-cn.com/problems/merge-k-sorted-lists/
// 降维到两个链表进行合并

class Solution23 {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        switch lists.count {
        case 0:
            return nil
        case 1:
            return lists[0]
        case 2:
            return merge2Lists(lists[0], lists[1])
        default:
            let mid = lists.count >> 1
            let left = mergeKLists(Array<ListNode?>(lists[lists.startIndex..<mid]))
            let right = mergeKLists(Array<ListNode?>(lists[mid..<lists.endIndex]))
            
            return merge2Lists(left, right)
        }
    }
    
    private func merge2Lists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let dummy = ListNode()
        
        var cur: ListNode? = dummy
        var p1: ListNode? = l1
        var p2: ListNode? = l2
        
        while let vaild1 = p1, let vaild2 = p2 {
            if vaild1.val < vaild2.val {
                cur?.next = p1
                p1 = p1?.next
            } else {
                cur?.next = p2
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
