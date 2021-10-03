//
//  Solution166.swift
//  
//
//  Created by VassilyChi on 2021/10/3.
//

import Foundation

/// 整个问题的解决办法是模拟竖式除法
/// 需要注意的点是: 除数和被除数是否是同号; 先将小数部分单独计算出
/// 这里用到了一些数学的知识
class Solution166 {
    func fractionToDecimal(_ numerator: Int, _ denominator: Int) -> String {
        
        if numerator % denominator == 0 {
            return "\(numerator / denominator)"
        }
        
        var result = ""
        
        if (numerator < 0) != (denominator < 0) {
            result = "-"
        }
        
        let absNumberator = abs(numerator)
        let absDenominator = abs(denominator)
        
        let intPart = absNumberator / absDenominator
        var remainder = absNumberator % absDenominator
        
        result += "\(intPart)."
        
        var remainderDict = [Int: Int]()
        var index = 0
        var fractionPart = ""
        
        // 如果余数除尽 -或者- 开始循环, 则跳出
        // 这里两个数相除, 应该只包含能除尽的 和 除不尽但是是循环小数, 不应该出现无限不循环小数, 因为无限不循环小数为无理数
        while remainder != 0 && !remainderDict.keys.contains(remainder) {
            remainderDict[remainder] = index
            remainder *= 10
            fractionPart += "\(remainder / absDenominator)"
            remainder %= denominator
            index += 1
        }
        
        if remainder != 0 {
            let leftStart = remainderDict[remainder]!
            fractionPart.insert("(", at: fractionPart.index(fractionPart.startIndex, offsetBy: leftStart))
            fractionPart.append(")")
        }
        
        result += fractionPart
        return result
    }
}
