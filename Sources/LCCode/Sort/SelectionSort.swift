//
//  SelectionSort.swift
//  
//
//  Created by VassilyChi on 2021/10/6.
//

import Foundation

public extension Array where Element: Comparable {
    /// 选择排序
    /// tips:
    /// 需要注意的是, 传入compare的元素的先后顺序, 这里可以语义化的理解, 如果inner的比select的元素大, 则记录inner
    /// - Parameter comparison: 比较规则
    /// - Returns: 排序后的新数组
    func selectionSort(_ comparison: Compare) -> [Element] {
        if count <= 1 { return self }
        
        var elements = self
        
        for index in elements.indices.reversed().dropLast() {
            var selectedIndex = 0
            for inner in stride(from: 1, through: index, by: 1) {
                if comparison(elements[selectedIndex], elements[inner]) {
                    selectedIndex = inner
                }
            }
            
            elements.swapAt(index, selectedIndex)
        }
        
        return elements
    }
}
