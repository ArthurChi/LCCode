//
//  Soulution61.swift
//  
//
//  Created by VassilyChi on 2021/9/22.
//

import Foundation

/*
 形成环以后, 进行拆解
 */

class Solution61 {
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        if k == 0 || head == nil || head?.next == nil { return head }
        
        var nodeCount = 1
        var tmp = head
        
        while tmp?.next != nil {
            tmp = tmp?.next
            nodeCount += 1
        }
        
        let revertCount = nodeCount - k % nodeCount
        if revertCount == nodeCount { return head }
        
        tmp?.next = head
        
        for _ in 0..<revertCount {
            tmp = tmp?.next
        }
        
        let newHead = tmp?.next
        tmp?.next = nil
        
        return newHead
    }
}
