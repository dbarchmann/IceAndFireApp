//
//  IceAndFireUITests.swift
//  IceAndFireUITests
//
//  Created by DIDBARCH on 30.06.22.
//

import XCTest

class IceAndFireUITests: XCTestCase {

    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        
        let app = XCUIApplication()
        
        if !app.launchArguments.contains(AppEnvironment.uiTest.rawValue) {
            app.launchArguments.append(AppEnvironment.uiTest.rawValue)
        }
        app.launch()
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // TODO: Use accessibility identifier to better identify xcui elements. No magic strings please!
    
    func testThatItShowsTheCorrectMasterView() {
        // Arrange
        let app = XCUIApplication()
        
        // Act & Assert
        XCTAssertTrue(app.staticTexts["Houses of Westeros"].exists)
        XCTAssertTrue(app.staticTexts["House Arryn of the Eyrie"].exists)
        XCTAssertTrue(app.staticTexts["The Vale"].exists)
    }
    
    func testThatItShowsTheCorrectDetailView() {
        // Arrange
        let app = XCUIApplication()
        
        // Act
        app.cells["House Arryn of the Eyrie, The Vale"].tap()
        
        // Assert
        XCTAssertTrue(app.staticTexts["Region"].exists)
        XCTAssertTrue(app.staticTexts["Coat Of Arms"].exists)
        XCTAssertTrue(app.staticTexts["Words"].exists)
        XCTAssertTrue(app.staticTexts["Titles"].exists)
    }
}
