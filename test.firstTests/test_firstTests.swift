//
//  test_firstTests.swift
//  test.firstTests
//
//  Created by Svyat Petrov on 10.02.2021.
//

import XCTest
@testable import test_first

class test_firstTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
    }
    
    func testCountDigitAmount() throws {
        let Utilities = UtilitiesProvider()
        
        XCTAssertEqual(Utilities.countDigitAmount("123"), 3)
        XCTAssertEqual(Utilities.countDigitAmount("asd"), 0)
        XCTAssertEqual(Utilities.countDigitAmount("h1g2j4"), 3)
        XCTAssertEqual(Utilities.countDigitAmount(""), 0)
    }
    
    func testCountAmountOfCharacters() throws {
        let Utilities = UtilitiesProvider()
        
        XCTAssertEqual(Utilities.countAmountOfCharacters("aaaaaa", substring: "a"), 6)
        XCTAssertEqual(Utilities.countAmountOfCharacters("bbbbbb", substring: "a"), 0)
        XCTAssertEqual(Utilities.countAmountOfCharacters("", substring: "a"), 0)
    }
    
    func testGetLastQuarter() throws {
        let Utilities = UtilitiesProvider()
        
        XCTAssertEqual(Utilities.getLastQuarter("aabbccdd"), "dd")
        XCTAssertEqual(Utilities.getLastQuarter("abcd"), "d")
        XCTAssertEqual(Utilities.getLastQuarter("abc"), "")
        XCTAssertEqual(Utilities.getLastQuarter(""), "")
    }
    
    func testGetMiddleThird() throws {
        let Utilities = UtilitiesProvider()
        
        XCTAssertEqual(Utilities.getMiddleThird("123"), "2")
        XCTAssertEqual(Utilities.getMiddleThird("1234"), "2")
        XCTAssertEqual(Utilities.getMiddleThird("123456"), "34")
        XCTAssertEqual(Utilities.getMiddleThird("12345678"), "345")
        XCTAssertEqual(Utilities.getMiddleThird(""), "")
    }
}
