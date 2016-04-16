//
//  NetworkManager.swift
//  Weather
//
//  Created by Daniel Devesa Derksen-Staats on 20/02/2016.
//  Copyright © 2016 Desfici. All rights reserved.
//

import Foundation
import Alamofire

enum Method: String {
    case GET
}

struct WeatherAPI {
    static func request(method: Method,
                        url: String,
                        response:(result: AnyObject?,
        error: NSError?) -> ()) {
        Alamofire.request(.GET, url)
            .responseJSON { alamoResponse in
                print(alamoResponse.request)  // original URL request
                print(alamoResponse.response) // URL response
                print(alamoResponse.data)     // server data
                print(alamoResponse.result)   // result of response serialization
                response(result:alamoResponse.result.value, error:alamoResponse.result.error)
        }
    }
}
