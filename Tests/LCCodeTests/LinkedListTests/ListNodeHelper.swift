//
//  ListNodeHelper.swift
//  LCCode
//
//  Created by VassilyChi on 2021/9/19.
//

import Foundation
@testable import LCCode

extension Array where Element == Int {
    var listNodes: ListNode? {
        if isEmpty { return nil }
        
        let dummy = ListNode()
        
        _ = reduce(dummy) { node, value in
            let tmpNode = ListNode(value)
            node.next = tmpNode
            return tmpNode
        }
        
        return dummy.next
    }
}

extension ListNode {
    var size: Int {
        var size = 0
        
        var cur: ListNode? = self
        
        while cur != nil {
            cur = cur?.next
            size += 1
        }
        
        return size
    }
    
    func equals(_ elements: [Int]) -> Bool {
        let assert = elements.listNodes

        var assertP: ListNode? = assert
        var sP: ListNode? = self
        
        while assertP != nil && sP != nil {
            if assertP!.val == sP!.val {
                assertP = assertP?.next
                sP = sP?.next
            } else {
                return false
            }
        }
        
        if assertP != nil || sP != nil {
            return false
        }

        return true
    }
}
