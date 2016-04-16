//
//  WeatherServiceParserProtocol.swift
//  Weather
//
//  Created by Daniel Devesa Derksen-Staats on 20/02/2016.
//  Copyright © 2016 Desfici. All rights reserved.
//

import Foundation

protocol WeatherParserProtocol {

    static func parseWeather(json: AnyObject) -> Weather?
}
