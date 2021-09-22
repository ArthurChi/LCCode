//
//  Solution86.swift
//  
//
//  Created by VassilyChi on 2021/9/22.
//

import Foundation

class Solution86 {
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        let dummyLessNodes: ListNode? = .init()
        let dummyMoreNodes: ListNode? = .init()

        var cur = head
        var lessCur = dummyLessNodes
        var moreCur = dummyMoreNodes

        while let curVaild = cur {
            if curVaild.val < x {
                lessCur?.next = curVaild
                lessCur = lessCur?.next
            } else {
                moreCur?.next = curVaild
                moreCur = moreCur?.next
            }
            cur = cur?.next
        }

        lessCur?.next = dummyMoreNodes?.next
        moreCur?.next = nil
        return dummyLessNodes?.next
    }
}
