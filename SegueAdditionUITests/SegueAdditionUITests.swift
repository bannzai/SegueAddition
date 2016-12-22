//
//  SegueAdditionUITests.swift
//  SegueAdditionUITests
//
//  Created by kingkong999yhirose on 2016/04/18.
//  Copyright © 2016年 kingkong999yhirose. All rights reserved.
//

import XCTest

class SegueAdditionUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        
        let app = XCUIApplication()
        let toTestButton = app.buttons["To TEST"]
        toTestButton.tap()
        
        let manualSegueStandardButton = app.buttons["Manual Segue Standard"]
        manualSegueStandardButton.tap()
        
        let backButton = app.navigationBars["SegueAddition.ManualSegueUseStandardView"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0)
        backButton.tap()
        
        let manualSegueUseSegueButton = app.buttons["Manual Segue Use Segue"]
        manualSegueUseSegueButton.tap()
        
        let backButton2 = app.navigationBars["SegueAddition.ManualSegueUseSegueClosureView"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0)
        backButton2.tap()
        
        let segueSettingStoryboardButton = app.buttons["Segue Setting Storyboard"]
        segueSettingStoryboardButton.tap()
        
        let backButton3 = app.navigationBars["SegueAddition.SegueSettingStoryboardView"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0)
        backButton3.tap()
        manualSegueStandardButton.tap()
        backButton.tap()
        manualSegueUseSegueButton.tap()
        backButton2.tap()
        segueSettingStoryboardButton.tap()
        backButton3.tap()
        
        let backButton4 = app.navigationBars["SegueAddition.CycleReferenceCheckView"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0)
        backButton4.tap()
        toTestButton.tap()
        backButton4.tap()
        
    }
    
}
