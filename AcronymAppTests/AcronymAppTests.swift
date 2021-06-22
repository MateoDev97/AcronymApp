//
//  AcronymAppTests.swift
//  AcronymAppTests
//
//  Created by Mateo Ortiz on 21/06/21.
//

import XCTest
import Alamofire
@testable import AcronymApp

class AcronymAppTests: XCTestCase {
    
    func testSuccessAcronymRequest() {
        let e = expectation(description: "Success request")

        let params: Parameters = ["sf": "FIFA"]
        RemoteDataManager.mainCallApi(method: .get, path: .PATH_DICTIONARY, params: params, callbackSuccess: { response in

            XCTAssertNotNil(response)
            XCTAssertEqual("FIFA", response.arrayValue[0]["sf"].stringValue)
            XCTAssertEqual(2, response.arrayValue[0]["lfs"].arrayValue.count)
            
            e.fulfill()
            
        }, callbackFail: { failure in
            
            debugPrint(failure)
            e.fulfill()
            
        })

        waitForExpectations(timeout: 20.0, handler: nil)
    }
    
    func testFailureResponse(){
        let e = expectation(description: "Failure response")

        let params: Parameters = ["sf": "MBA"]
        RemoteDataManager.mainCallApi(method: .get, path: .PATH_DICTIONARY, params: params, callbackSuccess: { response in

            XCTAssertNotNil(response)
            XCTAssertEqual("FIFA", response.arrayValue[0]["sf"].stringValue)

            e.fulfill()

        }, callbackFail: { failure in

            debugPrint(failure)
            e.fulfill()

        })

        waitForExpectations(timeout: 20.0, handler: nil)
    }
    
    func testBadRequest(){
        let e = expectation(description: "Bad request")

        let params: Parameters = ["token": "dasdsd574aqdasdasd"]
        RemoteDataManager.mainCallApi(method: .get, path: .PATH_DICTIONARY, params: params, callbackSuccess: { response in

            XCTAssertNotNil(response)
            
            XCTAssertEqual(response.arrayValue.count, 0)
            
            e.fulfill()
            
        }, callbackFail: { failure in
            
            debugPrint(failure)
            e.fulfill()
            
        })

        waitForExpectations(timeout: 20.0, handler: nil)
    }

}
