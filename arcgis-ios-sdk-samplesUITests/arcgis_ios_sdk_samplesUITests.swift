//
//  arcgis_ios_sdk_samplesUITests.swift
//  arcgis-ios-sdk-samplesUITests
//
//  Created by Ryan Olson on 6/21/17.
//  Copyright © 2017 Esri. All rights reserved.
//

import XCTest

class arcgis_ios_sdk_samplesUITests: XCTestCase {
        
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
    
    
    func randomBetweenNumbers(firstNum: CGFloat, secondNum: CGFloat) -> CGFloat{
        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - secondNum) + min(firstNum, secondNum)
    }
    func randomScreenPoint(element: XCUIElement) -> CGPoint{
        return CGPoint(x: randomBetweenNumbers(firstNum: 0, secondNum: element.frame.width),
                       y: randomBetweenNumbers(firstNum: 0, secondNum: element.frame.height))
    }
    
    func randomCoord(_ element: XCUIElement) -> XCUICoordinate{
        
        let dx = randomBetweenNumbers(firstNum: 0.4, secondNum: 0.6)
        let dy = randomBetweenNumbers(firstNum: 0.4, secondNum: 0.6)
        
        print("dx: \(dx), dy: \(dy)")
        
        return element.coordinate(withNormalizedOffset:CGVector(dx: dx, dy: dy))
        
//        return element.coordinate(withNormalizedOffset:
//            CGVector(dx: randomBetweenNumbers(firstNum: 0.3, secondNum: 0.9),
//                     dy: ))
    }
    
    func testExample() {
        
        self.continueAfterFailure = false
        
        let app = XCUIApplication()
        app.collectionViews.images["Route & Directions_icon"].tap()
        app.tables.staticTexts["Offline routing"].tap()
        app.navigationBars["Offline routing"].buttons["Switch to full screen mode"].tap()
        
        let mapviewElement = app.otherElements["MapView"]
        mapviewElement.tap()
        
        let trashIt = 20
        
        for i in 0...1_000_000{
            autoreleasepool{
                
                let fromCoordinate = randomCoord(mapviewElement)
                let toCoordinate = randomCoord(mapviewElement)
                fromCoordinate.press(forDuration: 0.8, thenDragTo: toCoordinate)
                
                if (i % trashIt) == (trashIt - 1){
                    let trash = app.buttons["trashBlue"]
                    if trash.exists{
                        trash.tap()
                    }
                }
                
                print("***")
                print("***")
                print(" ")
                print(" iterations: \(i)")
                print(" ")
                print("***")
                print("***")
            }
        }

    }
    
    func test2(){
        
    }
}
