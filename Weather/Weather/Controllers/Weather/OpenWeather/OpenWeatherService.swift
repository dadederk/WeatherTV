//
//  OpenWeatherService.swift
//  Weather
//
//  Created by Daniel Devesa Derksen-Staats on 19/02/2016.
//  Copyright © 2016 Desfici. All rights reserved.
//

import Foundation

struct OpenWeatherService: WeatherServiceProtocol {

    private let baseUrl = "http://api.openweathermap.org/data"
    private let version = "2.5"
    private let weatherMethod = "weather"
    private let apiKeyParameterName = "APPID"
    private let unitsParameterName = "units"
    private let cityNameParameterName = "q"
    
    enum Units: String {
        case Metric = "metric"
        case Imperial = "imperial"
    }
    
    func requestUrlWithMethod(method: String, queryItems: Array<NSURLQueryItem>) -> NSURL? {
        let urlComponents = NSURLComponents(string: baseUrl)!
        
        urlComponents.path?.appendPathComponent(version)
        urlComponents.path?.appendPathComponent(method)
        urlComponents.queryItems = queryItems
        
        return urlComponents.URL
    }
    
    func weatherForCititWithName(name: String,
                                 country: String,
                                 completionHandler: (weather: Weather?) -> ()) {
        let apiKey = WeatherServiceConfiguration(serviceName: String(OpenWeatherService)).apiKey
        let cityNameQueryItem = NSURLQueryItem(name: cityNameParameterName,
                                               value: "\(name),\(country)")
        let unitsQueryItem = NSURLQueryItem(name: unitsParameterName, value: Units.Metric.rawValue)
        let apiKeyQueryItem = NSURLQueryItem(name: apiKeyParameterName, value: apiKey)
        let queryItems = [cityNameQueryItem, unitsQueryItem, apiKeyQueryItem]
        let queryUrl = self.requestUrlWithMethod(weatherMethod, queryItems: queryItems)
        
        if let queryUrlString = queryUrl?.absoluteString {
            WeatherAPI.request(.GET, url:queryUrlString) { (result, error) in
                if let json = result {
                    let weather = OpenWeatherParser.parseWeather(json)
                    
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
