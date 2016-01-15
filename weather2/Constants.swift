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
let API_KEY = "&APPID=d5dfbbca97307e254653f9c8ac59fd2b"

public typealias DownloadComplete = () -> ()
