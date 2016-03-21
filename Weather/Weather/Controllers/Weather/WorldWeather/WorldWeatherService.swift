//
//  WorldWeatherService.swift
//  Weather
//
//  Created by Daniel Devesa Derksen-Staats on 29/02/2016.
//  Copyright © 2016 Desfici. All rights reserved.
//

import Foundation

struct WorldWeatherService : WeatherServiceProtocol {

    private let baseUrl = "https://api.worldweatheronline.com/free/v2/weather.ashx"
    
    private let apiKeyParameterName = "key"
    private let cityNameParameterName = "q"
    private let formatParameterName = "format"
    
    enum Format: String {
        case XML = "xml"
        case JSON = "json"
    }
    
    func weatherForCititWithName(name: String, country: String, completionHandler: (weather: Weather?) -> ()) {

        let apiKey = WeatherServiceConfiguration(serviceName: String(WorldWeatherService)).apiKey
        
        let formattedName = name.stringByReplacingOccurrencesOfString(" ", withString: "+")
        let formattedCountry = country.stringByReplacingOccurrencesOfString(" ", withString: "+")
        
        let cityNameQueryItem = NSURLQueryItem(name: cityNameParameterName, value: "\(formattedName),\(formattedCountry)")
        let apiKeyQueryItem = NSURLQueryItem(name: apiKeyParameterName, value: apiKey)
        let formatQueryItem = NSURLQueryItem(name: formatParameterName, value: Format.JSON.rawValue)
        let queryItems = [cityNameQueryItem, apiKeyQueryItem, formatQueryItem]
        
        let queryUrl = NSURLComponents(string: baseUrl)!
        queryUrl.queryItems = queryItems
        
        if let queryUrlString = queryUrl.URL?.absoluteString {
            
            WeatherAPI.request(.GET, url:queryUrlString) { (result, error) in
                
                if let json = result {
                    
                    let weather = WorldWeatherParser.parseWeather(json)
                    
                    completionHandler(weather: weather)
                } else {
                    
                    completionHandler(weather: nil)
                }
            }
        } else {
            completionHandler(weather: nil)
        }
    }
}