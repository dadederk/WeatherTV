//
//  WeatherviewControllerTests.swift
//  Weather
//
//  Created by Daniel Devesa Derksen-Staats on 02/04/2016.
//  Copyright © 2016 Desfici. All rights reserved.
//

import XCTest
@testable import Weather

class WeatherViewControllerTests: XCTestCase {

    var sut: WeatherViewController!
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name:"Main", bundle:nil)
        sut = storyboard.instantiateViewControllerWithIdentifier(String(WeatherViewController)) as! WeatherViewController
        _ = sut.view
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_HasCityNameLabel() {
    
        XCTAssertNotNil(sut.cityNameLabel)
    }
    
    func test_HasTemperatureLabel() {
    
        XCTAssertNotNil(sut.currentTemperatureLabel)
    }
}
