//
//  OpenWeatherParser.swift
//  Weather
//
//  Created by Daniel Devesa Derksen-Staats on 20/02/2016.
//  Copyright © 2016 Desfici. All rights reserved.
//

import Foundation

struct OpenWeatherParser: WeatherParserProtocol {
    static func parseWeather(json: AnyObject) -> Weather? {
        var weather: Weather?
        
        if let mainInfo = json.objectForKey("main"),
        let cityName = json.objectForKey("name") as? String,
        let currentTemperature = mainInfo.objectForKey("temp") as? Float {
            weather = Weather(city: cityName, temperature: currentTemperature)
        }
        
        return weather
    }
}
