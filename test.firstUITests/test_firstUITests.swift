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
        let app = XCUIApplication()
        app.launch()
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        let app = XCUIApplication()
        app.terminate()
    }

    func testExample() throws {
        let MainWindow = XCUIApplication().windows.firstMatch
        let firstStringTextField = MainWindow.textFields["First String"]
        firstStringTextField.click()
        firstStringTextField.typeText("12345678901aamamacmzzzzzzzzzz\t")
        MainWindow.textFields["Second String"].typeText("aabbzz123\t")
        let resultText = XCUIApplication().windows.firstMatch.staticTexts.element(boundBy: 4)
        XCTAssertEqual(resultText.value as! String, "Amount: 0")
        MainWindow.textFields["first special symbol"].typeText("a\t")
        MainWindow.textFields["second special symbol"].typeText("m")
        MainWindow.buttons["Calculate"].click()
        let result = XCUIApplication().windows.firstMatch.staticTexts.element(boundBy: 4)
        XCTAssertEqual(result.value as! String, "Amount: 7")
    }
    
    func testExistanceOfElements() throws {
        let mainWindow = XCUIApplication().windows.firstMatch
        
        let UIElementsTextFieldsNames = ["First String", "Second String","first special symbol","second special symbol"]
        let UIElementsButtonsTexts = ["Calculate"]
        let UIElementsStaticResultText = mainWindow.staticTexts.element(boundBy: 4)
        var UIElements: [XCUIElement] = [XCUIElement]()
        
        for name in UIElementsTextFieldsNames {
            UIElements.append(mainWindow.textFields[name])
        }
        for buttonName in UIElementsButtonsTexts {
            UIElements.append(mainWindow.buttons[buttonName])
        }
        
        UIElements.append(UIElementsStaticResultText)
        
        for UIElement in UIElements {
            XCTAssertEqual(UIElement.exists, true)
        }
        
    }
    
    func testInitialStatusOfElements() throws {
        let mainWindow = XCUIApplication().windows.firstMatch
        
        let UIElementsTextFieldsNames = ["First String", "Second String","first special symbol","second special symbol"]
        let UIElementsButtonsTexts = ["Calculate"]
        let UIElementsStaticResultText = mainWindow.staticTexts.element(boundBy: 4)
        var UIElements: [XCUIElement] = [XCUIElement]()
        
        for name in UIElementsTextFieldsNames {
            UIElements.append(mainWindow.textFields[name])
        }
        for buttonName in UIElementsButtonsTexts {
            UIElements.append(mainWindow.buttons[buttonName])
        }
        
        UIElements.append(UIElementsStaticResultText)
        
        for UIElement in UIElements {
            switch UIElement.elementType {
            case XCUIElement.ElementType.textField:
                XCTAssertEqual(UIElement.value as! String, "")
            case XCUIElement.ElementType.button:
                XCTAssertEqual(UIElement.exists, true)
            case XCUIElement.ElementType.staticText:
                XCTAssertEqual(UIElement.value as! String, "Amount: 0")
            default:
                continue
            }
        }
    }
    
    func testErrorInput () throws {
        let mainWindow = XCUIApplication().windows.firstMatch
        let button = mainWindow.buttons["Calculate"].firstMatch
//        XCTAssertEqual(button.exists, true)
        button.click()
        print(button.value as! String)
        let alert = mainWindow.sheets.firstMatch
//        XCUIApplication().windows["SwiftUI.ModifiedContent<test_first.ContentView, SwiftUI._EnvironmentKeyWritingModifier<Swift.Optional<test_first.UtilitiesProvider>>>-1-AppWindow-1"].sheets["alert"].click()
        XCTAssertEqual(alert.exists, true)
        let dismissButton = alert.buttons["Dismiss"]
        XCTAssertEqual(dismissButton.exists, true)
        dismissButton.click()
        XCTAssertEqual(alert.exists, false)
        
    }
}
