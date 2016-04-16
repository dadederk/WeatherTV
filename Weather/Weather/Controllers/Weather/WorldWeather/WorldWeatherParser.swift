//
//  WorldWeatherParser.swift
//  Weather
//
//  Created by Daniel Devesa Derksen-Staats on 01/03/2016.
//  Copyright © 2016 Desfici. All rights reserved.
//

import Foundation

struct WorldWeatherParser : WeatherParserProtocol {
    static func parseWeather(json: AnyObject) -> Weather? {
        var weather: Weather?
        
        if let mainInfo = json.objectForKey("data") {
            let cityName = (mainInfo.objectForKey("request")?.objectAtIndex(0).objectForKey("query") as? String)?.componentsSeparatedByString(",")[0]
            let currentTemperature = mainInfo.objectForKey("current_condition")?.objectAtIndex(0).objectForKey("temp_C") as! String
            let currentTemperatureFloat = NSNumberFormatter().numberFromString(currentTemperature)!.floatValue
            weather = Weather(city: cityName!, temperature: currentTemperatureFloat)
        }
        
        return weather
    }
}
