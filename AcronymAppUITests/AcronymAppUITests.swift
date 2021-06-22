//
//  AcronymAppUITests.swift
//  AcronymAppUITests
//
//  Created by Mateo Ortiz on 21/06/21.
//

import XCTest

class AcronymAppUITests: XCTestCase {

    func testValidWord(){
        let app = XCUIApplication()
        app.launch()
        
        
        let textFieldAcronym = app.textFields["textFieldAcronym"]
        textFieldAcronym.tap()
        textFieldAcronym.typeText("MBA")
        
        let buttonSearch = app.buttons["searchButton"]
        buttonSearch.tap()
        
        
        sleep(10)
    }
    
    func testNoWord(){
        let app = XCUIApplication()
        app.launch()
        
        let buttonSearch = app.buttons["searchButton"]
        buttonSearch.tap()
        
        sleep(10)
    }
    
    
    func testNoResults(){
        let app = XCUIApplication()
        app.launch()
        
        
        let textFieldAcronym = app.textFields["textFieldAcronym"]
        textFieldAcronym.tap()
        textFieldAcronym.typeText("AASDASASSKDKS")
        
        let buttonSearch = app.buttons["searchButton"]
        buttonSearch.tap()
        
        
        sleep(10)
    }
    
    
}
