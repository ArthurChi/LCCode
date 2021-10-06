//
//  SortHelper.swift
//  
//
//  Created by VassilyChi on 2021/10/6.
//

import Foundation

class SortHelper {
    
    /// 生成指定个数的0到100的随机数
    /// - Parameter count: 生成随即数组的个数
    /// - Returns: 随机数的数组
    static func generateRandom(count: Int = 50) -> [Int] {
        (0..<count).map { _ in Int.random(in: 0..<100) }
    }
}
