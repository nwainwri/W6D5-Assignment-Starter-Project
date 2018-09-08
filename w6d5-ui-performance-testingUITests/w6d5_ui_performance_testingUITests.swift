//
//  w6d5_ui_performance_testingUITests.swift
//  w6d5-ui-performance-testingUITests
//
//  Created by Nathan Wainwright on 2018-09-07.
//  Copyright © 2018 Roland. All rights reserved.
//

import XCTest

@testable import w6d5_ui_performance_testing


class w6d5_ui_performance_testingUITests: XCTestCase {
  
  var app: XCUIApplication!
  override func setUp() {
    super.setUp()
    //    let app = XCUIApplication() // initially was in testExample()
    //Create an object that acts as a proxy to your app (the app being tested). This proxy object represents your entire application so we can use it to get references to the various UI elements on screen.
    app = XCUIApplication()
    
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
  
  func test_AddMeal(){
    let addButton = app.navigationBars["Master"].buttons["Add"]
    addButton.tap()
    
    let addAMealAlert = app.alerts["Add a Meal"]
    
    let collectionViewsQuery = addAMealAlert.collectionViews
    collectionViewsQuery.children(matching: .other).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .textField).element.typeText("Burger")
    
    let textField = collectionViewsQuery.children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .textField).element
    textField.tap()
    textField.typeText("300")
    
    addAMealAlert.buttons["Ok"].tap()
  }
  
  func test_ShowMealDetail() {
    showMealDetails(meal: "Burger", calories: "300")
    XCTAssert(app.staticTexts["detailViewControllerLabel"].label == "Burger - 300", "Should Show Burger Details")
    app.navigationBars["Detail"].buttons["Master"].tap()
  }
  
  func test_RemoveMeal(){
    deleteMeal(meal: "Burger", calories: "300")
  }
  
  // MARK: -- extra functions
  func showMealDetails(meal: String, calories: String) {
    XCUIApplication().tables.cells.staticTexts["\(meal) - \(calories)"].tap()
  }
  
  func deleteMeal(meal: String, calories: String){
    let staticText = app.tables.staticTexts["\(meal) - \(calories)"]
    if staticText.exists {
      staticText.swipeLeft()
      app.tables.buttons["Delete"].tap()
    }
  }
  
  
  func testPerformance() {
    measure {
      PerformanceDataModel.doSomething()
    }
  }
  
  
  
  
  
  
  
  
  
  
  
  
  //  func testExample() {
  //    // Use recording to get started writing UI tests.
  //    // Use XCTAssert and related functions to verify your tests produce the correct results.
  //
  //
  //    app.navigationBars["Master"] // app.navigationBars returns a list of navigation bars within your app. app.navigationBars["Master"] returns the XCUIElement that has the accessibility label "Master". In this case, it'll be main navigation bar of the master view controller.
  //      .buttons["Add"] // Get a list of all the descendant buttons of the main navigation bar, then return the button that has its accessibility label set to "Add"
  //      .tap() // Call the .tap() method on the XCUIElement representing the "Add" button in the navigation bar. This effectively simulates the user tapping on this button.
  //
  //    let addAMealAlert = app.alerts["Add a Meal"]
  //    addAMealAlert.collectionViews.children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .textField).element.tap()
  //    addAMealAlert.buttons["Ok"].tap()
  //
  //    //      Gets a reference to the alert window titled "Add a Meal", then it navigates down the alert's view hierarchy until it gets a reference to the XCUIElement object corresponding to the first UITextField then types the text "Burger" into it.
  //    //
  //    //      As you can see, the view hierarchy for the alert window with two text fields seems complicated. This hierarchy is not something that most developers would know off-hand because its an internal implementation detail of UIAlertController.
  //    //
  //    //      However, using Xcode's "Record UI Test" capability gives us a glimpse of this view hierarchy. More importantly, it allows us to obtain references to UI objects in our test script without knowing its view hierarchy beforehand.
  //  }
  
  
  
  
  
  
  
  
}
