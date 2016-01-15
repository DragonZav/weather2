//
//  CurrentWeather.swift
//  weather2
//
//  Created by Chris Augg on 1/14/16.
//  Copyright © 2016 Auggie Doggie iOSware. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class CurrentWeather {
    
    let dateFormatter = NSDateFormatter()
    
    // URL
    private var _url: NSURL
    private var _iconId: String!
    
    // Location
    private var _cityName: String!
    private var _cityId: Int!
    private var _lon: Float!
    private var _lat: Float!
    
    
    // Weather
    private var _humidity: Int!
    private var _tempMax: Float!
    private var _tempMin: Float!
    private var _temp: Float!
    private var _pressure: Int!
    private var _summary: String!
    
    // Time
    private var _sunset: Int!
    private var _sunrise: Int!
    
    var iconId: String {
        if _iconId == nil {
            _iconId = ""
        }
        return _iconId
    }
    
    
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    var cityId: String {
        if _cityId == nil {
        return ""
        }
        return "\(_cityId)"
    }
    
    var lon: String {
        if _lon == nil {
            return ""
        }
        return "\(_lon)"
    }
    
    var lat: String {
        if _lat == nil {
            return ""
        }
        return "\(_lat)"
    }
    
    var humidity: String {
        
        if _humidity == nil {
            return ""
        }
        return "\(_humidity)"
    }
    
    var tempMax: String {
        if _tempMax == nil {
            return ""
        }
        return convertKToF(_tempMax)
    }
    
    var tempMin: String {
        if _tempMin == nil {
            return ""
        }
        return convertKToF(_tempMin)
    }
    
    var temp: String {
        if _temp == nil {
            return ""
        }
        return convertKToF(_temp)
    }
    
    var pressure: String {
        if _pressure == nil {
            return ""
        }
        return "\(_pressure)"
    }
    
    var summary : String {
        if _summary == nil {
            _summary = ""
        }
        return _summary
    }
    
    var sunset: String {
        if _sunset == nil {
            return ""
        }
        return "\(timeStringFromUnixTime(Double(_sunset)))"
    }
    
    var sunrise: String {
        if _sunrise == nil {
            return ""
        }
        return "\(timeStringFromUnixTime(Double(_sunrise)))"
    }
    
    
    init(city: String) {
        _url = NSURL(string: "\(URL_BASE)\(URL_CITYNAME)\(city)\(API_KEY)")!
    }
    
    // Convert degrees in Kelvin to Fahrenheit and return as a String
    func convertKToF(kelvin: Float) -> String {
        return "\(kelvin * 9/5 - 459.67)"
    }
    
    func timeStringFromUnixTime(unixTime: Double) -> String {
        let date = NSDate(timeIntervalSince1970: unixTime)
        
        // Returns Date Formatted as 12 Hour Time.
        dateFormatter.dateFormat = "hh:mm a"
        return dateFormatter.stringFromDate(date)
    }    
    
    func downloadWeatherDetails(completed: DownloadComplete) {
        
         Alamofire.request(.GET, _url).validate().responseJSON { response in
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    let json = JSON(value)
                    
                    self._cityName = json["name"].string
                    self._cityId = json["id"].int
                    self._lon = json["coord"]["lon"].float
                    self._lat = json["coord"]["lat"].float
                    
                    self._humidity = json["main"]["humidity"].int
                    self._tempMax = json["main"]["temp_max"].float
                    self._tempMin = json["main"]["temp_min"].float
                    self._temp = json["main"]["temp"].float
                    self._pressure = json["main"]["temp_max"].int
                    
                    self._sunrise = json["sys"]["sunrise"].int
                    self._sunset = json["sys"]["sunset"].int
                    
                    self._summary = json["weather"][0]["description"].string
                    self._iconId = json["weather"][0]["icon"].string


                    
                    print("JSON: \(json)")
                    
                }
            case .Failure(let error):
                print(error)
            }
            
            completed()
        }
    }
}
