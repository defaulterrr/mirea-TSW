//
//  Utilities.swift
//  test.first
//
//  Created by Svyat Petrov on 13.02.2021.
//

import Foundation

final class UtilitiesProvider: ObservableObject {
    func countDigitAmount(_ string: String) -> Int {
        let digits = CharacterSet(charactersIn: "0123456789")
        if string.rangeOfCharacter(from: digits) != nil {
            var count = 0
            for char in string {
                if char.isNumber {
                    count += 1
                }
            }
            return count
        } else {
            return 0
        }
    }
    
    func countAmountOfCharacters(_ string: String, substring str: Character) -> Int {
        if string.rangeOfCharacter(from: CharacterSet(charactersIn: String(str))) != nil {
            var count = 0
            for ch in string {
                if str == ch  {
                    count += 1
                }
            }
            return count
        } else {
            return 0
        }
    }
    
    func getLastQuarter(_ string: String) -> String {
        if (string.count < 4) {
            return ""
        }
        let length = string.count
        let startIndex = length/4 * 3
        let substring = string[string.index(string.startIndex, offsetBy: startIndex) ..< string.endIndex]
        return String(substring)
    }
    
    func getMiddleThird(_ string: String) -> String {
        return String(string[string.index(string.startIndex, offsetBy: string.count/3) ..< string.index(string.startIndex, offsetBy: string.count*2/3)])
    }
    
    func containsAZ(_ string: String) -> Bool{
        if let _ = string.rangeOfCharacter(from: CharacterSet(charactersIn: "qwertyuiopasdfghjklzxcvbnm")) {
            return true
        } else {
            return false
        }
    }
}
