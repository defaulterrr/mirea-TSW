//
//  test_firstUITests.swift
//  test.firstUITests
//
//  Created by @defaulterrr on 10.02.2021.
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
        let app = XCUIApplication()
        app.launch()
        
        
        
        let MainWindow = XCUIApplication().windows.firstMatch
        let firstStringTextField = MainWindow.textFields["First String"]
        firstStringTextField.click()
        firstStringTextField.typeText("12345678901aamamacmzzzzzzzzzz\t")
        MainWindow.textFields["Second String"].typeText("aabbzz123\t")
        MainWindow.textFields["first special symbol"].typeText("a\t")
        MainWindow.textFields["second special symbol"].typeText("m")
        MainWindow.buttons["Calculate"].click()
        let result = XCUIApplication().windows.firstMatch.staticTexts.element(boundBy: 4)
        XCTAssertEqual(result.value as! String, "Amount: 7")
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
