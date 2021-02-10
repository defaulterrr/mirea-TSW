//
//  ContentView.swift
//  test.first
//
//  Created by Svyat Petrov on 10.02.2021.
//

import SwiftUI

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

struct ContentView: View {
    @State var firstString: String = ""
    @State var secondString: String = ""
    @State var firstSpecialSymbol: String = ""
    @State var secondSpecialSymbol: String = ""
    @State var amount: Int = 0
    @State var showAlert: Bool = false
    
    func calculateAmountOfSpecialSymbols(firstString s: String, secondString t: String, firstSpecialSymbol first: String, secondSpecialSymbol second: String) -> Int? {
        if (s.count == 0 || t.count == 0 || first.count == 0 || second.count == 0) {
            return nil
        }
        if (first.count > 1 || second.count > 1) {
            return nil
        }
        // if less than 12 digits in first string AND last quarter of second string does not contain [a-z]
        // calculate amount of firstSpecialSymbol and secondSpecialSymbols in second third of first string
        if (countDigitAmount(s) < 12  && !containsAZ(getLastQuarter(t))) {
            let secondThird = getMiddleThird(s)
            print("Counting: amount of \(Character(first)) and \(Character(second)) in \(secondThird)")
            let count = countAmountOfCharacters(secondThird, substring: Character(first)) + countAmountOfCharacters(secondThird, substring: Character(second))
            return count
        } else {
            return 0
        }
    }
    
    var body: some View {
        VStack {
            Section {
                HStack {
                    Spacer()
                    Text("S: ")
                    TextField("First String", text: $firstString)
                    Spacer()
                }
                HStack {
                    Spacer()
                    Text("T: ")
                    TextField("Second String", text: $secondString)
                    Spacer()
                }
                HStack {
                    Spacer()
                    Text("*: ")
                    TextField("first special symbol", text: $firstSpecialSymbol)
                    Spacer()
                }
                HStack {
                    Spacer()
                    Text("&: ")
                    TextField("second special symbol", text: $secondSpecialSymbol)
                    Spacer()
                }
            }
            Button("Calculate") {
                print("Button called")
                guard let newAmount = calculateAmountOfSpecialSymbols(firstString: firstString, secondString: secondString, firstSpecialSymbol: firstSpecialSymbol, secondSpecialSymbol: secondSpecialSymbol) else {
                    showAlert = true
                    return
                }
                amount = newAmount
                print(amount)
            }.alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Evaluation error"),
                    message: Text("Some of the strings are empty or unprocessable"),
                    dismissButton: .default(Text("Dismiss"))
                )
            }
            HStack{
                Spacer()
                Text("Amount: \(amount)")
                Spacer()
            }
        }.frame(minWidth: 100, idealWidth: 200, maxWidth: 500, minHeight: 100, idealHeight: 150, maxHeight: 350, alignment: .center
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
