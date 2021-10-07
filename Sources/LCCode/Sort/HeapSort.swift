//
//  HeapSort.swift
//  
//
//  Created by VassilyChi on 2021/10/7.
//

import Foundation

public extension Array where Element: Comparable {
    typealias Compare = (Element, Element) -> Bool
    func heapSort(_ comparison: Compare) -> [Element] {
        var elements = self
        var heapSize = elements.count
        
        // heapify
        for i in elements.indices.reversed() {
            elements.sift(from: i, until: heapSize, comparison)
        }
        
        while heapSize > 1 {
            heapSize -= 1
            elements.swapAt(0, heapSize)
            elements.sift(from: 0, until: heapSize, comparison)
        }
        
        return elements
    }
    
    mutating func sift(from index: Index, until: Int, _ comparison: Compare) {
        if index > (until >> 1) { return }
        
        var parent = index
        
        let leftIndex = parent << 1 + 1
        let rightIndex = leftIndex + 1
        
        if rightIndex < until && comparison(self[parent], self[rightIndex]) {
            parent = rightIndex
        }
        
        if leftIndex < until && comparison(self[parent], self[leftIndex]) {
            parent = leftIndex
        }
        
        if parent == index {
            return
        }
        
        self.swapAt(index, parent)
        sift(from: parent, until: until, comparison)
    }
}
