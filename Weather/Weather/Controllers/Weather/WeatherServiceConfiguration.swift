//
//  WeatherServiceConfiguration.swift
//  Weather
//
//  Created by Daniel Devesa Derksen-Staats on 01/03/2016.
//  Copyright © 2016 Desfici. All rights reserved.
//

import Foundation

struct WeatherServiceConfiguration {
    
    let serviceName: String
    
    var apiKey: String? {
        return self.weatherConfigurationValueForKey("ApiKey") as? String
    }
    
    func weatherConfigurationValueForKey(key: String) -> AnyObject? {
    
        var value: AnyObject?
        var globalConfiguration: NSDictionary?
        
        if let path = NSBundle.mainBundle().pathForResource(String(WeatherServiceConfiguration), ofType: "plist") {
            
            globalConfiguration = NSDictionary(contentsOfFile: path)
        }
        
        if let globalConfiguration = globalConfiguration {
            
            value = globalConfiguration.objectForKey(self.serviceName)?.objectForKey(key)!
        }
        
        return value;
    }
}