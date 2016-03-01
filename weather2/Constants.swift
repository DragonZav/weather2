//
//  Constants.swift
//  weather2
//
//  Created by Chris Augg on 1/14/16.
//  Copyright © 2016 Auggie Doggie iOSware. All rights reserved.
//

import Foundation


let URL_BASE = "http://api.openweathermap.org"
let URL_CITYNAME = "/data/2.5/weather?q="
let URL_CITYID = "/data/2.5/weather?id="
let URL_CITYFORECAST = "/data/2.5/forecast?q="
let API_KEY = "Sorry, someone abused using my key"




public typealias DownloadComplete = () -> ()


// Convert degrees in Kelvin to Fahrenheit and return as a String
func convertKtoF(kelvin: Double) -> String {
    
    return "\(Int(round((((kelvin * 9) / 5) - 459.67))))"
}

