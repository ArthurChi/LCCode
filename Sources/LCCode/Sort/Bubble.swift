//
//  Bubble.swift
//  
//
//  Created by VassilyChi on 2021/10/5.
//

import Foundation

public extension Array where Element: Comparable {
    
    /// 冒泡排序:
    /// 整个过程使用外部循环开控制内部循环的结束的点
    /// 首轮是从1到最后, 后面逐次递减, 因为每次执行完一轮后的最后一个元素是有序的
    /// 具体实现中, 外层循环使用了更加语义化的描述, 内部循环没有使用{for in}的形式, 因为这是一个习惯问题, 在for-in描述的时候, 需要保证后面的range是合法的, 否则会crash, 使用stride则无需做这样的保证
    /// 同时需要注意, 在规则有等于的时候, 会造成排序不稳定的情况
    /// - Parameter comparison: 比较规则
    /// - Returns: 排序后的新数组
    func bubbleSort(_ comparison: (Element, Element) -> Bool) -> [Element] {
        if count <= 1 { return self }
        var elements = self
        
        for index in elements.indices.reversed().dropLast() {
            for innerIndex in stride(from: 1, through: index, by: 1) {
                let before = elements.index(before: innerIndex)
                if comparison(elements[innerIndex], elements[before]) {
                    elements.swapAt(innerIndex, before)
                }
            }
        }
        
        return elements
    }
    
    
    /// 冒泡排序的优化一
    /// 优化思路, 在进行内轮扫描时, 记录当前轮扫描是否有序, 如果有序, 则证明整体有序, 则后续无需继续扫描, 可以直接退出
    /// - Parameter comparison: 比较规则
    /// - Returns: 排序后的新数组
    func bubbleSortV1(_ comparison: (Element, Element) -> Bool) -> [Element]  {
        if count <= 1 { return self }
        
        var elements = self
        
        for index in elements.indices.reversed().dropLast() {
            var isSorted = true
            for innerIndex in stride(from: 1, through: index, by: 1) {
                let before = elements.index(before: innerIndex)
                if comparison(elements[innerIndex], elements[before]) {
                    elements.swapAt(before, innerIndex)
                    isSorted = false
                }
            }
            
            if isSorted {
                break
            }
        }
        
        return elements
    }
    
    /// 冒泡优化v2
    /// 这个版本优化包含了v1版本的优化, 同时比v1版本多的功能是对于偏有序的数组(部分有序)的时候, 可以提升效率
    /// - Parameter comparison: 比较规则
    /// - Returns: 排序后的新数组
    func bubbleSortV2(_ comparison: (Element, Element) -> Bool) -> [Element] {
        if count <= 1 { return self }
        
        var elements = self
        
        var endIndex = elements.count - 1
        while endIndex > 0 {
            var sorttedIndex = 1
            for inner in stride(from: 1, through: endIndex, by: 1) {
                let before = elements.index(before: inner)
                if comparison(elements[inner], elements[before]) {
                    elements.swapAt(inner, before)
                    sorttedIndex = inner
                }
            }
            
            endIndex = sorttedIndex
            endIndex -= 1
        }
        
        return elements
    }
}
