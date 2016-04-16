//
//  AccuWeatherParser.swift
//  Weather
//
//  Created by Daniel Devesa Derksen-Staats on 01/03/2016.
//  Copyright © 2016 Desfici. All rights reserved.
//

import Foundation

struct AccuWeatherParser: WeatherParserProtocol {

    static func parseWeather(json: AnyObject) -> Weather? {
        return Weather(city: "", temperature: 0)
    }
}
