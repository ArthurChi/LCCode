//
//  Solution100.swift
//  
//
//  Created by VassilyChi on 2021/9/28.
//

import Foundation

class Solution100 {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        switch (p, q) {
        case (nil, nil):
            return true
        case (nil, _), (_, nil):
            return false
        case (let v1, let v2):
            return v1?.val == v2?.val && isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
        }
    }
}
