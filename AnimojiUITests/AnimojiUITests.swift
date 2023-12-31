//
//  AnimojiUITests.swift
//  AnimojiUITests
//
//  Created by Syed Mansoor on 04/10/23.
//

import XCTest

final class AnimojiUITests: XCTestCase {

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

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    
    func testToVerifyNextButton(){
        let application = XCUIApplication()
        let nextButton = application.buttons["arrowshape.turn.up.forward.fill"]
        let foxEmoji = application.staticTexts["🦊"]
        let pandaEmoji = application.staticTexts["🐼"]
        
        if foxEmoji.waitForExistence(timeout: 2) {
            guard nextButton.waitForExistence(timeout: 2) else {
                XCTFail("Unable to find the next button")
                return
            }
            nextButton.tap()
            guard pandaEmoji.exists else {
                XCTFail("Failed to find the Panda emoji")
                return
            }
        } else {
            XCTFail("Failed to find the Fox emoji")
        }
    }
}
