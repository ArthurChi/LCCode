//
//  File.swift
//  
//
//  Created by VassilyChi on 2021/9/28.
//

import Foundation

/// [99题](https://leetcode-cn.com/problems/recover-binary-search-tree/solution/san-chong-jie-fa-xiang-xi-tu-jie-99-hui-fu-er-cha-/)的另一种解法, 使用DFS中序的方法, 来查找顺序不对的结点, 然后置换位置
public class Solution99_1 {
    
    var x: TreeNode?
    var y: TreeNode?
    var pre: TreeNode?
    
    func recoverTree(_ root: TreeNode?) {
        dfs(root)
        
        if let x = self.x, let y = self.y {
            let tmp = x.val
            x.val = y.val
            y.val = tmp
        }
    }
    
    /// 这里需要注意, 因为题目中说BST中的两个结点有问题, 那么必然一个节点的错序是大于后继结点, 另一个错序是小于前驱节点, 这里使用x记录当前节点, y只记录一次错位结点的方式, 巧妙的解决了这个问题
    /// - Parameter root: 根节点
    public func dfs(_ root: TreeNode?) {
        guard let vaildRoot = root else { return }
        
        dfs(root?.left)
        
        if let pre = self.pre {
            if pre.val > vaildRoot.val {
                x = root
                if y == nil {
                    y = pre
                }
            }
        }
        
        pre = root
        dfs(root?.right)
    }
}
