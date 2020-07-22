//
//  TrafficLightTests.swift
//  TrafficLightTests
//
//  Created by ibrahim on 21/07/20.
//  Copyright © 2020 ibrahim. All rights reserved.
//

import XCTest
@testable import TrafficLight

class TrafficLightTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testTrafficNextColor() {
        // default light should be red, and it will change  to  green
        let presenter = TrafficLightPresenter(trafficLightService: TrafficLightService())
        XCTAssertEqual(presenter.trafficLightNextColor(), TrafficLightColor.green)
        // set to green,  next color shold be yellow
        presenter.setTrafficLightColor(color: .green)
        XCTAssertEqual(presenter.trafficLightNextColor(), TrafficLightColor.yellow)
        // set to yellow,  next color shold be green
        presenter.setTrafficLightColor(color: .yellow)
        XCTAssertEqual(presenter.trafficLightNextColor(), TrafficLightColor.red)
    }

}
