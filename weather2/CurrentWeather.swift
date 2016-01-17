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
    
    private let DATE_FORMATTER = NSDateFormatter()
    
    // Location
    private var _cityName: String!
    private var _cityId: Int!
    private var _lon: Float!
    private var _lat: Float!
    
    
    // Weather
    private var _humidity: Int!
    private var _tempMax: Double!
    private var _tempMin: Double!
    private var _temp: Double!
    private var _pressure: Int!
    private var _summary: String!
    private var _iconId: String!
    private var _windSpeed: Float!
    
    
    // Time
    private var _sunset: Int!
    private var _sunrise: Int!
    
    init(cityName: String, cityId: Int, lon: Float, lat: Float, humidity: Int, tempMax: Double,
        tempMin: Double, temp: Double, pressure: Int, summary: String, iconId: String,
        sunset: Int, sunrise: Int, windSpeed: Float) {
            
            _cityName = cityName
            _cityId = cityId
            _lon = lon
            _lat = lat
            _humidity = humidity
            _tempMax = tempMax
            _tempMin = tempMin
            _temp = temp
            _pressure = pressure
            _summary = summary
            _iconId = iconId
            _sunset = sunset
            _sunrise = sunrise
            _windSpeed = windSpeed
    }
    
    convenience init() {
        self.init()
    }
    
    var windSpeed: String {
        if _windSpeed == nil {
            return ""
        }
        return "\(round(_windSpeed))"
    }
    
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
        return "\(convertKtoF(_tempMax))°"
    }
    
    var tempMin: String {
        if _tempMin == nil {
            return ""
        }
        return "\(convertKtoF(_tempMin))°"
    }
    
    var temp: String {
        if _temp == nil {
            return ""
        }
        return "\(convertKtoF(_temp))°"
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
    
   func timeStringFromUnixTime(unixTime: Double) -> String {
        let date = NSDate(timeIntervalSince1970: unixTime)
        
        // Returns Date Formatted as 12 Hour Time.
        DATE_FORMATTER.dateFormat = "hh:mm a"
        return DATE_FORMATTER.stringFromDate(date)
    }
}
