//
//  DailyCell.swift
//  weather2
//
//  Created by Chris Augg on 1/16/16.
//  Copyright © 2016 Auggie Doggie iOSware. All rights reserved.
//

import UIKit

class DailyCell: UITableViewCell {

    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var tempMaxLbl: UILabel!
    @IBOutlet weak var tempMinLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var summaryLbl: UILabel!
    
    var dailyWeather: DailyWeather!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(dailyWeather: DailyWeather) {
        self.dailyWeather = dailyWeather
        
        tempMaxLbl.text = self.dailyWeather.tempMax
        tempMinLbl.text = self.dailyWeather.tempMin
        dateLbl.text = self.dailyWeather.date
        summaryLbl.text = self.dailyWeather.summary
        weatherIcon.image = UIImage(named: self.dailyWeather.iconId)
    }

}
