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
        
        var index = index
        
        while index < (until >> 1) {
            var biggestChildIndex = (index << 1) + 1
            let rightIndex = biggestChildIndex + 1
            
            if rightIndex < until && comparison(self[biggestChildIndex], self[rightIndex]) {
                biggestChildIndex = rightIndex
            }
            
            if comparison(self[biggestChildIndex], self[index]) {
                break
            }
            
            self.swapAt(index, biggestChildIndex)
            index = biggestChildIndex
        }
    }
}
