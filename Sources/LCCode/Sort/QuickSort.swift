//
//  QuickSort.swift
//  
//
//  Created by VassilyChi on 2021/10/11.
//

import Foundation

public extension Array where Element: Comparable {
    func quickSort(_ comparison: Compare) -> [Element] {
        guard count > 1 else { return self }
        
        var elements = self
        elements.sort(startIndex, endIndex, comparison)
        return elements
    }
    
    mutating private func sort(_ begin: Index, _ end: Index, _ comparison: Compare) {
        if end - begin < 2 { return }
        let mid = pivotIndex(begin, end, comparison)
        sort(begin, mid, comparison)
        sort(mid + 1, end, comparison)
    }
    
    mutating private func pivotIndex(_ begin: Index, _ end: Index, _ comparison: Compare) -> Index {
        var begin = begin
        var end = end - 1
        
        let midValue = self[begin]
        
        while begin < end {
            while begin < end {
                if comparison(midValue, self[end]) {
                    end -= 1
                } else {
                    swapAt(begin, end)
                    begin += 1
                    break
                }
            }
            
            while begin < end {
                if comparison(self[begin], midValue) {
                    begin += 1
                } else {
                    swapAt(begin, end)
                    end -= 1
                    break
                }
            }
        }
        
        self[begin] = midValue
        return begin
    }
    
    func quickSortV1() -> [Element] {
        guard count > 1 else { return self }
        
        let midValue = self[count >> 1]
        let less = self.filter { $0 < midValue }
        let equal = self.filter { $0 == midValue }
        let more = self.filter { $0 > midValue }
        
        return less.quickSortV1() + equal + more.quickSortV1()
    }
}
