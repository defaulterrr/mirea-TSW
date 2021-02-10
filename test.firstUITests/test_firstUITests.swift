//
//  test_firstUITests.swift
//  test.firstUITests
//
//  Created by Svyat Petrov on 10.02.2021.
//

import XCTest

class test_firstUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        let testFirstContentview1Appwindow1Window = XCUIApplication().windows["test_first.ContentView-1-AppWindow-1"]
        let firstStringTextField = testFirstContentview1Appwindow1Window.textFields["First String"]
        firstStringTextField.click()
        firstStringTextField.typeText("asd\t")
        testFirstContentview1Appwindow1Window.textFields["Second String"].typeText("aassddff\t")
        testFirstContentview1Appwindow1Window.textFields["first special symbol"].typeText("a\t")
        testFirstContentview1Appwindow1Window.textFields["second special symbol"].typeText("s")
        testFirstContentview1Appwindow1Window.buttons["Calculate"].click()
        
        let result = XCUIApplication().windows["test_first.ContentView-1-AppWindow-1"].staticTexts["Amount: 0"]
        
        XCTAssertEqual(result.firstMatch.value as! String, "Amount: 0")
        
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
