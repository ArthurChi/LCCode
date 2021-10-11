//
//  InsertionSort.swift
//  
//
//  Created by VassilyChi on 2021/10/8.
//

import Foundation

public extension Array where Element: Comparable {
    
    /// 插入排序
    /// - Parameter comparison: 比较规则
    /// - Returns: 排序后的新数组
    func insertionSort(_ comparison: Compare) -> [Element] {
        guard count > 1 else { return self }
        
        var elements = self
        
        for i in 1..<elements.count {
            var cur = i
            while cur > 0 && !comparison(elements[cur - 1], elements[cur]) {
                elements.swapAt(cur, cur - 1)
                cur -= 1
            }
        }
        
        return elements
    }
    
    /// 插入排序:
    /// 优化思路, 减少交换次数, 通过比较, 找到合适的位置, 同时在这个过程中, 将元素向后移动
    /// - Parameter comparison: 比较规则
    /// - Returns: 排序后的新数组
    func insertionSortV1(_ comparison: Compare) -> [Element] {
        guard count > 1 else { return self }
        
        var elements = self
        for i in 1..<elements.count {
            var cur = i
            let curValue = elements[cur]
            while cur > 0 && !comparison(elements[cur - 1], curValue) {
                elements[cur] = elements[cur - 1]
                cur -= 1
            }
            
            elements[cur] = curValue
        }
        
        return elements
    }
    
    /// 插入排序:
    /// 使用二分查找法找到合适的位置, 然后将元素后移, 使用二分的方法只是减少了比较次数, 但是整个算法的复杂度并没有改变
    /// - Parameter comparison: 比较规则
    /// - Returns: 排序后的新数组
    func insertionSortV2() -> [Element] {
        guard count > 1 else { return self }
        
        var elements = self
        
        for i in 1..<elements.count {
            let targetIndex = elements.binarySearch(i, range: 0..<i)
            
            let value = elements[i]
            var cur = i
            
            while cur > targetIndex {
                elements[cur] = elements[cur - 1]
                cur -= 1
            }
            
            elements[cur] = value
        }
        
        return elements
    }
    
    func binarySearch(_ index: Index, range: Range<Index>) -> Index {
        var start = range.lowerBound
        var end = range.upperBound
        
        while start < end {
            let mid = (start + end) >> 1
            // 这里需要记住
            if self[index] <= self[mid] {
                end = mid
            } else {
                start = mid + 1
            }
        }
        
        return start
    }
}
