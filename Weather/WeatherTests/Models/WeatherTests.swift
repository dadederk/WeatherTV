//
//  WeatherTests.swift
//  Weather
//
//  Created by Daniel Devesa Derksen-Staats on 02/04/2016.
//  Copyright © 2016 Desfici. All rights reserved.
//

import XCTest
@testable import Weather

class WeatherTests: XCTestCase {

    let degreesCharacter = "\u{00B0}"
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testInit_ShouldSetCity() {
    
        let expectedCity = "London"
        let weather = Weather(city: expectedCity, temperature: 10)
        
        XCTAssertEqual(weather.city, expectedCity)
    }
    
    func testInit_ShouldSetTemperature() {
    
        let expectedTemperature: Float = 10.0
        let weather = Weather(city: "London", temperature: expectedTemperature)
        
        XCTAssertEqual(weather.temperature, expectedTemperature)
    }
    
    func testFormatedTemperature_ReturnsExpectedFormat() {
    
        let weather = Weather(city: "London", temperature: 10.4)
        
        XCTAssertEqual(weather.formatedTemperature, "\(10)\(degreesCharacter)")
    }
    
    func testFormatedTemperature_RoundsTemperatureNumber() {
    
        var weather = Weather(city: "London", temperature: 10.4)
        
        XCTAssertEqual(weather.formatedTemperature, "\(10)\(degreesCharacter)")
        
        weather.temperature = 10.5
        
        XCTAssertEqual(weather.formatedTemperature, "\(11)\(degreesCharacter)")
    }
}
