//
//  ViewController.swift
//  weather2
//
//  Created by Chris Augg on 1/14/16.
//  Copyright © 2016 Auggie Doggie iOSware. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentWeather = CurrentWeather(city: "Yelm")
    
   @IBOutlet weak var weatherIcon: UIImageView!
   @IBOutlet weak var tableView: UITableView!
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundView = BackgroundView()
        
        currentWeather.downloadWeatherDetails { () -> () in
          print("Download Completed")
            
            print("City:        \(self.currentWeather.cityName)")
            print("ID:          \(self.currentWeather.cityId)")
            print("Longitude:   \(self.currentWeather.lon)")
            print("Latitude:    \(self.currentWeather.lat)")
            print("Humidity:    \(self.currentWeather.humidity)")
            print("High Temp:   \(self.currentWeather.tempMax)")
            print("Low Temp:    \(self.currentWeather.tempMax)")
            print("Temp:        \(self.currentWeather.temp)")
            print("Pressure:    \(self.currentWeather.pressure)")
            print("Sunrise:     \(self.currentWeather.sunrise)")
            print("Sunset:      \(self.currentWeather.sunset)")
            print("Summary:     \(self.currentWeather.summary)")
            print("Icon ID:     \(self.currentWeather.iconId)")
            self.weatherIcon.image = UIImage(named: self.currentWeather.iconId)
      }
        
    }

}
    




