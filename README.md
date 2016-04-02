# WeatherTV
WeatherTV is a weather app for Apple TV. The goal is to develop a simple app that allows you to choose the service that provides you with the forecast information.

## Getting started
In order for the app to be able to get data from the different weather services APIs, you will need to get their corresponding API keys and configure them into the `WeatherServiceConfiguration.plist` file.

At the moment, two services are supported:
* **World Weather Online**: You can get the API key by registering here: http://developer.worldweatheronline.com/api/
* **Open Weather Map**: The API key and documentation can be obtained from: http://openweathermap.org/api

Once you've registered and got the API keys, you will need to add them to the `WeatherServiceConfiguration.plist` file provided that should look similar to the one in the example:

**Example:** 
If your 'api key' for `World Weather Online` is '1234' and your 'api key' for `Open Weather Map` is '5678', the file should look like this:
```
<plist version="1.0">
<dict>
	<key>WorldWeatherService</key>
	<dict>
		<key>ApiKey</key>
		<string>1234</string>
	</dict>
	<key>OpenWeatherService</key>
	<dict>
		<key>ApiKey</key>
		<string>5678</string>
	</dict>
</dict>
</plist>
```

## Adding more services
There is a `WeatherServiceFactory.swift` that defines an *enum* with the different supported services and provides a static method for returning the service you'll like (*Open Weather Map* by default):
```
enum WeatherService {
    
    case OpenWeather, WorldWeather
}

struct WeatherServiceFactory {
    
    static func weatherService(weatherService:WeatherService = .OpenWeather) -> (WeatherServiceProtocol) {
        
        switch weatherService {
            
        case .OpenWeather:
            return OpenWeatherService()
        
        case .WorldWeather:
            return WorldWeatherService()
        }
    }
}
```

The first step would be to add the new service here as well as the corresponding configuration in the `WeatherServiceConfiguration.plist` file.

Then, you will need to implement one class that implements the protocol `WeatherServiceProtocol` and another one implementing the protocol `WeatherParserProtocol`. 
