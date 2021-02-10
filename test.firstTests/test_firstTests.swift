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
        XCTAssertEqual(countDigitAmount("123"), 3)
        XCTAssertEqual(countDigitAmount("asd"), 0)
        XCTAssertEqual(countDigitAmount("h1g2j4"), 3)
        XCTAssertEqual(countDigitAmount(""), 0)
    }
    
    func testCountAmountOfCharacters() throws {
        XCTAssertEqual(countAmountOfCharacters("aaaaaa", substring: "a"), 6)
        XCTAssertEqual(countAmountOfCharacters("bbbbbb", substring: "a"), 0)
        XCTAssertEqual(countAmountOfCharacters("", substring: "a"), 0)
    }
    
    func testGetLastQuarter() throws {
        XCTAssertEqual(getLastQuarter("aabbccdd"), "dd")
        XCTAssertEqual(getLastQuarter("abcd"), "d")
        XCTAssertEqual(getLastQuarter("abc"), "")
        XCTAssertEqual(getLastQuarter(""), "")
    }
    
    func testGetMiddleThird() throws {
        XCTAssertEqual(getMiddleThird("123"), "2")
        XCTAssertEqual(getMiddleThird("1234"), "2")
        XCTAssertEqual(getMiddleThird("123456"), "34")
        XCTAssertEqual(getMiddleThird("12345678"), "345")
        XCTAssertEqual(getMiddleThird(""), "")
    }
}
