//
//  WeatherServiceProtocol.swift
//  Weather
//
//  Created by Daniel Devesa Derksen-Staats on 19/02/2016.
//  Copyright © 2016 Desfici. All rights reserved.
//

import Foundation

protocol WeatherServiceProtocol {
    
    func weatherForCititWithName(name: String, country: String, completionHandler: (weather:Weather?) -> ())
}