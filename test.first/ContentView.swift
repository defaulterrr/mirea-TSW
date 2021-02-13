//
//  ContentView.swift
//  test.first
//
//  Created by @defaulterrr on 10.02.2021.
//

import SwiftUI


struct ContentView: View {
    @State var firstString: String = ""
    @State var secondString: String = ""
    @State var firstSpecialSymbol: String = ""
    @State var secondSpecialSymbol: String = ""
    @State var amount: Int = 0
    @State var showAlert: Bool = false
    
    @EnvironmentObject var Utilities: UtilitiesProvider
    
    func calculateAmountOfSpecialSymbols(firstString s: String, secondString t: String, firstSpecialSymbol first: String, secondSpecialSymbol second: String) -> Int? {
        if (s.count == 0 || t.count == 0 || first.count == 0 || second.count == 0) {
            return nil
        }
        if (first.count > 1 || second.count > 1) {
            return nil
        }
        // if less than 12 digits in first string AND last quarter of second string does not contain [a-z]
        // calculate amount of firstSpecialSymbol and secondSpecialSymbols in second third of first string
        if (Utilities.countDigitAmount(Utilities.getFirstMiddle(s)) < 12  && !Utilities.containsAZ(Utilities.getLastQuarter(t))) {
            let secondThird = Utilities.getMiddleThird(s)
            print("Counting: amount of \(Character(first)) and \(Character(second)) in \(secondThird)")
            let count = Utilities.countAmountOfCharacters(secondThird, substring: Character(first)) + Utilities.countAmountOfCharacters(secondThird, substring: Character(second))
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
