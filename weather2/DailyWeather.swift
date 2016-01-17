//
//  DailyWeather.swift
//  weather2
//
//  Created by Chris Augg on 1/16/16.
//  Copyright © 2016 Auggie Doggie iOSware. All rights reserved.
//

import Foundation

class DailyWeather {
    
    private var _tempMax: Double!
    private var _tempMin: Double!
    private var _summary: String!
    private var _iconId: String!
    private var _date: Int!
    
    var tempMax: String {
        if _tempMax == nil {
            return ""
        }
        
        return convertKtoF(_tempMax)
    }
    
    var tempMin: String {
        if _tempMin == nil {
            return ""
        }
        
        return convertKtoF(_tempMin)
    }
    
    var summary: String {
        if _summary == nil {
            _summary = ""
        }
        return _summary
    }
    
    var iconId: String {
        if _iconId == nil {
            _iconId = ""
        }
        
        return _iconId
    }
    
    var date: String {
        if _date == nil {
            return ""
        }
        
        return "Need to convert to Date"
        
    }
    
    
    
    init(tempMax: Double, tempMin: Double, summary: String, iconID: String, date: Int) {
        _tempMax = tempMax
        _tempMin = tempMin
        _summary = summary
        _iconId = iconID
        _date = date
    }    
    
    
}