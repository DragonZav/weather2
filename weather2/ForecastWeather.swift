//
//  Forecast.swift
//  weather2
//
//  Created by Chris Augg on 1/16/16.
//  Copyright © 2016 Auggie Doggie iOSware. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class ForecastWeather {
    
    private var _currentWeather: CurrentWeather!
    private var _weeklyWeather: [DailyWeather]!
    private var _forecastURL: NSURL!
    private var _weatherURL: NSURL!
    
    var weeklyWeather: [DailyWeather] {
        if _weeklyWeather == nil {
            _weeklyWeather = [DailyWeather]()
        }
        return _weeklyWeather
    }
    
    var currentWeather: CurrentWeather {
        if _currentWeather == nil {
            _currentWeather = CurrentWeather()
        }
        return _currentWeather
    }
    
    init(city: String) {
        _forecastURL = NSURL(string: "\(URL_BASE)\(URL_CITYFORECAST)\(city)\(API_KEY)")!
        _weatherURL = NSURL(string: "\(URL_BASE)\(URL_CITYNAME)\(city)\(API_KEY)")!
    }
    
    func downloadWeatherDetails(completed: DownloadComplete) {
        
        Alamofire.request(.GET, self._weatherURL).validate().responseJSON { response in
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    let json = JSON(value)
                    
                    let cityName = json["name"].stringValue
                    let cityId = json["id"].intValue
                    let lon = json["coord"]["lon"].floatValue
                    let lat = json["coord"]["lat"].floatValue
                    
                    let humidity = json["main"]["humidity"].intValue
                    
                    let tempMax = json["main"]["temp_max"].doubleValue
                    let tempMin = json["main"]["temp_min"].doubleValue
                    let temp = json["main"]["temp"].doubleValue
                    
                    let windSpeed = json["wind"]["speed"].floatValue
                    
                    let pressure = json["main"]["pressure"].intValue
                    
                    let sunrise = json["sys"]["sunrise"].intValue
                    let sunset = json["sys"]["sunset"].intValue
                    
                    let summary = json["weather"][0]["description"].stringValue
                    let iconId = json["weather"][0]["icon"].stringValue
                    
                    self._currentWeather = CurrentWeather(cityName: cityName, cityId: cityId, lon: lon, lat: lat, humidity: humidity, tempMax: tempMax, tempMin: tempMin, temp: temp, pressure: pressure, summary: summary, iconId: iconId, sunset: sunset, sunrise: sunrise, windSpeed: windSpeed)
                    
                    
                    print("JSON: \(json)")
                    
                }
            case .Failure(let error):
                print(error)
            }
            
        }
        
        Alamofire.request(.GET, _forecastURL).validate().responseJSON { response in
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    let json = JSON(value)
                    
                    if let days = json["list"].array {
                        
                        for day in days {
                            
                            let dt = day["dt"].intValue
                            let tempMax = day["main"]["temp_max"].doubleValue
                            let tempMin = day["main"]["temp_min"].doubleValue
                            let summary = day["weather"][0]["description"].stringValue
                            let iconId = day["weather"][0]["icon"].stringValue                            
                            
                            let weekDay = DailyWeather(tempMax: tempMax, tempMin: tempMin, summary: summary, iconID: iconId, date: dt)
                            
                            self._weeklyWeather.append(weekDay)
                            
                        }
                    }
                }
            case .Failure(let error):
                print(error)
            }
           completed()
       } // close alamofire
        
        
   } // close downloadWeatherDetails
}
