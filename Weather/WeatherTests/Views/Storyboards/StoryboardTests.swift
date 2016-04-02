//
//  StoryboardTests.swift
//  Weather
//
//  Created by Daniel Devesa Derksen-Staats on 02/04/2016.
//  Copyright © 2016 Desfici. All rights reserved.
//

import XCTest
@testable import Weather

class StoryboardTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testInitialViewController_IsWeatherViewController() {
    
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let initialViewController = storyboard.instantiateViewControllerWithIdentifier(String(WeatherViewController))
        
        XCTAssertTrue(initialViewController is WeatherViewController)
    }
}
