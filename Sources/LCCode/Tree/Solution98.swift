//
//  Solution98.swift
//  
//
//  Created by VassilyChi on 2021/9/25.
//

import Foundation
class Solution98 {
    /// 验证是否是BST, 这道题的一些启发, 在LC上提交代码时, 是可以修改最初给的函数的参数, 只要给新增的参数默认值即可, 另外~=操作符, 在range对象中, 是判断是否在range范围内
    /// - Parameters:
    ///   - root: 根节点
    ///   - range: 值范围
    /// - Returns: 是否是BST
    func isValidBST(_ root: TreeNode?, _ range: Range<Int> = Int.min..<Int.max) -> Bool {
        guard let vaildRoot = root else { return true }
        guard range ~= vaildRoot.val else { return false }
        return isValidBST(vaildRoot.left, range.lowerBound..<vaildRoot.val) && isValidBST(vaildRoot.right, (vaildRoot.val + 1)..<range.upperBound)
    }
}
