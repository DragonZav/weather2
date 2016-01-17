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
    
    
    @IBOutlet weak var tempMaxLbl: UILabel!
    @IBOutlet weak var tempMinLbl: UILabel!
    
    @IBOutlet weak var hPaLbl: UILabel!
    @IBOutlet weak var windLbl: UILabel!
    @IBOutlet weak var humidityLbl: UILabel!
    @IBOutlet weak var tempLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var sunriseLbl: UILabel!
    @IBOutlet weak var sunsetLbl: UILabel!
    
    var forecastWeather = ForecastWeather(city: "Yelm")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       tableView.delegate = self
       tableView.dataSource = self
        
        forecastWeather.downloadWeatherDetails { () -> () in
           self.updateUI()
            
                   }
            }
    
    func updateUI() {
       
        
        weatherIcon.image = UIImage(named: self.forecastWeather.currentWeather.iconId)
        tempMaxLbl.text = forecastWeather.currentWeather.tempMax
        tempMinLbl.text = forecastWeather.currentWeather.tempMin
        tempLbl.text = forecastWeather.currentWeather.temp
        windLbl.text = forecastWeather.currentWeather.windSpeed
        hPaLbl.text = forecastWeather.currentWeather.pressure
        humidityLbl.text = forecastWeather.currentWeather.humidity
        sunriseLbl.text = forecastWeather.currentWeather.sunrise
        sunsetLbl.text = forecastWeather.currentWeather.sunset
        
        
        self.tableView.reloadData()
    }

    
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("DailyCell") as? DailyCell {
            let dailyWeather = forecastWeather.weeklyWeather[indexPath.row]
            
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
        return forecastWeather.weeklyWeather.count
    }

}
    




