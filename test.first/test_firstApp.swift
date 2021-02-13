//
//  test_firstApp.swift
//  test.first
//
//  Created by @defaulterrr on 10.02.2021.
//

import SwiftUI

@main
struct test_firstApp: App {
    let Utilities = UtilitiesProvider()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(Utilities)
        }
    }
}
