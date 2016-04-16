//
//  WeatherServiceProvider.swift
//  Weather
//
//  Created by Daniel Devesa Derksen-Staats on 20/02/2016.
//  Copyright © 2016 Desfici. All rights reserved.
//

import Foundation

enum WeatherService {
    case OpenWeather, WorldWeather
}

struct WeatherServiceFactory {
    static func weatherService(weatherService: WeatherService = .OpenWeather) -> (WeatherServiceProtocol) {
        switch weatherService {
        case .OpenWeather:
            return OpenWeatherService()
        case .WorldWeather:
            return WorldWeatherService()
        }
    }
}
