//
//  MergeSort.swift
//  
//
//  Created by VassilyChi on 2021/10/10.
//

import Foundation

public extension Array where Element: Comparable {
    /// 归并排序:
    /// * 整体思路, 先进行divide, 然后进行merge
    /// - Parameter comparison: 比较规则
    /// - Returns: 返回的新数组
    func mergeSort(_ comparison: Compare) -> [Element] {
        guard self.count >= 1 else { return self }
        return sort(comparison: comparison)
    }
    
    private func sort(comparison: Compare) -> [Element] {
        if self.count < 2 { return self }
        
        let mid = startIndex + ((endIndex - startIndex) >> 1)
        
        let left = [Element](self[startIndex..<mid]).sort(comparison: comparison)
        let right = [Element](self[mid..<endIndex]).sort(comparison: comparison)
        
        return left.merge(right, comparison: comparison)
    }
    
    private func merge(_ other: [Element], comparison: Compare) -> [Element] {
        
        var orderPail = [Element]()
        orderPail.reserveCapacity(self.count + other.count)
        
        var leftIndex = self.startIndex
        var rightIndex = other.startIndex
        
        while leftIndex < self.endIndex && rightIndex < other.endIndex {
            if comparison(self[leftIndex], other[rightIndex]) {
                orderPail.append(self[leftIndex])
                leftIndex += 1
            } else if (comparison(other[rightIndex], self[leftIndex])) {
                orderPail.append(other[rightIndex])
                rightIndex += 1
            } else {
                orderPail.append(self[leftIndex])
                leftIndex += 1
                orderPail.append(other[rightIndex])
                rightIndex += 1
            }
        }
        
        while leftIndex < self.endIndex {
            orderPail.append(self[leftIndex])
            leftIndex += 1
        }
        
        while rightIndex < other.endIndex {
            orderPail.append(other[rightIndex])
            rightIndex += 1
        }
        
        return orderPail
    }
}
