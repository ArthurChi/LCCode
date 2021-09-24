//
//  Solution445.swift
//  
//
//  Created by VassilyChi on 2021/9/24.
//

import Foundation

class Solution445 {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var stack1: [ListNode] = .init()
        var stack2: [ListNode] = .init()
        
        let dummy: ListNode? = .init()
        
        var p1 = l1
        var p2 = l2
        
        while let vaildP1 = p1 {
            stack1.append(vaildP1)
            p1 = p1?.next
        }
        
        while let vaildP2 = p2 {
            stack2.append(vaildP2)
            p2 = p2?.next
        }
        
        var curry = 0
        
        while !stack1.isEmpty || !stack2.isEmpty || curry != 0 {
            let v1 = stack1.popLast()?.val ?? 0
            let v2 = stack2.popLast()?.val ?? 0
            let v = (v1 + v2 + curry)
            curry = v / 10
            
            let newNode: ListNode = .init(v % 10)
            let next = dummy?.next
            dummy?.next = newNode
            newNode.next = next
        }
        
        return dummy?.next
    }
}
