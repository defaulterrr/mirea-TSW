//
//  Utilities.swift
//  test.first
//
//  Created by @defaulterrr on 13.02.2021.
//

import Foundation

final class UtilitiesProvider: ObservableObject {
    /// Counts amount of digits present in the given String
    /// - Parameter string: A String object to count digits in
    /// - Returns: Always returns an Int as a number of digits present in String
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
    
    /// Returns first middle of the given String object
    /// - Parameter string: A String object to split
    /// - Returns: Generally, returns first middle of the String object, if given object has a length of 1 or 0, original Object is returned, if given Object's length is uneven, first half will be the largest of possible two ("abc" will return "ab")
    func getFirstMiddle(_ string: String) -> String {
        let length = string.count
        if (length < 2) {
            return string
        } else {
            let halfLength: Int = length/2
            if length.isMultiple(of: 2) {
                return String(string[string.startIndex ... string.index(string.startIndex, offsetBy: halfLength-1)])
            }
            return String(string[string.startIndex ... string.index(string.startIndex, offsetBy: halfLength)])
        }
    }
    
    /// Counts amount of special given Characters in given String object
    /// - Parameters:
    ///   - string: A String object to count Characters in
    ///   - str: A Character object to count
    /// - Returns: Always returns an Int as a number of characters present in String
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
    
    /// Get last quarter of the given String Object
    /// - Parameter string: A String Object to split
    /// - Returns: If given String's length is lesser than 4, empty String will be returned. In other cases, the last quarter will be returned as the largest quarter
    func getLastQuarter(_ string: String) -> String {
        if (string.count < 4) {
            return ""
        }
        let length = string.count
        let startIndex = length/4 * 3
        let substring = string[string.index(string.startIndex, offsetBy: startIndex) ..< string.endIndex]
        return String(substring)
    }
    
    /// Get a second third of the Given String Object
    /// - Parameter string: A String Object to split
    /// - Returns: If given String's length is lesser than 3, empty String will be returned. In other cases, the second third will be returned by following ruling: "1234" -> "2", "12345" -> "23", "123456" -> "34"
    func getMiddleThird(_ string: String) -> String {
        return String(string[string.index(string.startIndex, offsetBy: string.count/3) ..< string.index(string.startIndex, offsetBy: string.count*2/3)])
    }
    
    /// Checks if a Given String Object contains any of following symbols: [a-z]
    /// - Parameter string: A String Object to check
    /// - Returns: true if contains, false if it doesn't
    func containsAZ(_ string: String) -> Bool{
        if let _ = string.rangeOfCharacter(from: CharacterSet(charactersIn: "qwertyuiopasdfghjklzxcvbnm")) {
            return true
        } else {
            return false
        }
    }
}
