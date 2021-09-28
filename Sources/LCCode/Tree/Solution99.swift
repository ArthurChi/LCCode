//
//  Solution99.swift
//  
//
//  Created by VassilyChi on 2021/9/27.
//

import Foundation

/// 主要是思路是利用二叉搜索树的性质来进行中序遍历, 找到顺序不符合预期的结点进行值的交换
public class Solution99 {
    func recoverTree(_ root: TreeNode?) {
        let order = inorder(root)
        
        var first: TreeNode?
        var second: TreeNode?
        
        for i in 0..<order.count - 1 {
            if order[i].val > order[i+1].val {
                first = order[i+1]
                if second == nil {
                    second = order[i]
                }
            }
        }
        
        guard let vaildFirst = first, let vaildSecond = second else {
            return
        }
        
        let tmp = vaildFirst.val
        vaildFirst.val = vaildSecond.val
        vaildSecond.val = tmp
    }
    
    private func inorder(_ root: TreeNode?) -> [TreeNode] {
        var result = [TreeNode]()
        guard let vaildRoot = root else { return result }
        
        result += inorder(root?.left)
        result.append(vaildRoot)
        result += inorder(root?.right)
        
        return result
    }
}
