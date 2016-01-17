//
//  ViewController.swift
//  weather2
//
//  Created by Chris Augg on 1/14/16.
//  Copyright © 2016 Auggie Doggie iOSware. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    
   @IBOutlet weak var weatherIcon: UIImageView!
   
    
    @IBOutlet weak var tableView: UITableView!
    
   
    var currentWeather = CurrentWeather(city: "Yelm")
    var weeklyWeather = [DailyWeather]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       tableView.delegate = self
       tableView.dataSource = self
        
//        currentWeather.downloadWeatherDetails { () -> () in
//          print("Download Completed")
//            
//            print("City:        \(self.currentWeather.cityName)")
//            print("ID:          \(self.currentWeather.cityId)")
//            print("Longitude:   \(self.currentWeather.lon)")
//            print("Latitude:    \(self.currentWeather.lat)")
//            print("Humidity:    \(self.currentWeather.humidity)")
//            print("High Temp:   \(self.currentWeather.tempMax)")
//            print("Low Temp:    \(self.currentWeather.tempMin)")
//            print("Temp:        \(self.currentWeather.temp)")
//            print("Pressure:    \(self.currentWeather.pressure)")
//            print("Sunrise:     \(self.currentWeather.sunrise)")
//            print("Sunset:      \(self.currentWeather.sunset)")
//            print("Summary:     \(self.currentWeather.summary)")
//            print("Icon ID:     \(self.currentWeather.iconId)")
//            //self.weatherIcon.image = UIImage(named: self.currentWeather.iconId)
//      }
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        let day = DailyWeather(tempMax: 180.0, tempMin: 175.2, summary: "Partly Coudy", iconID: "13n", date: 12342314)
        let day2 = DailyWeather(tempMax: 180.0, tempMin: 175.2, summary: "Partly Coudy", iconID: "13n", date: 12342314)
        weeklyWeather.append(day)
        weeklyWeather.append(day2)
    }
    
    override func viewDidAppear(animated: Bool) {
        tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("DailyCell") as? DailyCell {
            let dailyWeather = weeklyWeather[indexPath.row]
            cell.configureCell(dailyWeather)
            return cell
        } else {
            return DailyCell()
        }        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weeklyWeather.count
    }

}
    




