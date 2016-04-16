//
//  Weather.swift
//  Weather
//
//  Created by Daniel Devesa Derksen-Staats on 19/02/2016.
//  Copyright © 2016 Desfici. All rights reserved.
//

import Foundation

struct Weather {
    
    let city: String
    var temperature: Float
    var formatedTemperature: String {
        get {
            let roundedCurrentTemperature = Int(round(temperature))

            return "\(roundedCurrentTemperature)\u{00B0}"
        }
    }
    
    init(city: String, temperature: Float) {
        self.city = city
        self.temperature = temperature
    }
}
