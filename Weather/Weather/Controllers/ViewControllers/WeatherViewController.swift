//
//  ViewController.swift
//  Weather
//
//  Created by Daniel Devesa Derksen-Staats on 12/01/2016.
//  Copyright © 2016 Desfici. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewWillAppear(animated: Bool) {
        self.cityNameLabel.text = ""
        self.currentTemperatureLabel.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let weatherService = WeatherServiceFactory.weatherService()
        let cityName = "Puebla de San Miguel"
        let country = "Spain"
        
        weatherService.weatherForCititWithName(cityName, country:country) { (weather) -> () in
            self.activityIndicator.stopAnimating()
            
            if let weather = weather {
                self.configureCurrentWeather(weather)
            } else {
                let alert = UIAlertController(title: "Error",
                                              message: "Error getting the forecast",
                                              preferredStyle: .Alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .Cancel, handler:nil))
                self.presentViewController(alert, animated: true, completion:nil)
            }
        }
    }
    
    func configureCurrentWeather(weather: Weather) {
        self.cityNameLabel.text = weather.city
        self.currentTemperatureLabel.text = weather.formatedTemperature
    }
}
