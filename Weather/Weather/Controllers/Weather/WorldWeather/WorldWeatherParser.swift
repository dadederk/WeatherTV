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
        if let data = json.objectForKey("data"),
            let query = data.objectForKey("request")?.objectAtIndex(0).objectForKey("query") as? String,
            let currentCondition = data.objectForKey("current_condition"),
            let currentTemperature = currentCondition.objectAtIndex(0).objectForKey("temp_C") as? String{
            
            let cityName = query.componentsSeparatedByString(",")[0]
            let currentTemperatureFloat = NSNumberFormatter().numberFromString(currentTemperature)!.floatValue
            
            weather = Weather(city: cityName, temperature: currentTemperatureFloat)
        }
    
        return weather
    }
}
