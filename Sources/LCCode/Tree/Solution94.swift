//
//  Solution94.swift
//  
//
//  Created by VassilyChi on 2021/9/24.
//

import Foundation

class Solution94 {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        []
    }
    
    private func recursion(_ root: TreeNode?) -> [Int] {
        if root == nil { return [] }
        
        var result = [Int]()
        
        result.append(contentsOf: inorderTraversal(root?.left))
        result.append(root!.val)
        result.append(contentsOf: inorderTraversal(root?.right))
        
        return result
    }
    
    private func iteration(_ root: TreeNode?) -> [Int] {
        if root == nil { return [] }
        var result = [Int]()
        var cur = root
        
        var stack = [TreeNode]()
        
        while cur != nil || !stack.isEmpty {
            while let vaildCur = cur {
                stack.append(vaildCur)
                cur = cur?.left
            }
            
            let curNode = stack.removeLast()
            result.append(curNode.val)
            cur = curNode.right
        }
        
        return result
    }
}
