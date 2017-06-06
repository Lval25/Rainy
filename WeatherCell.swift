//
//  WeatherCell.swift
//  Rainy
//
//  Created by Loyd Vallot on 5/30/17.
//  Copyright © 2017 Loyd's Productions. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var weatheType: UILabel!
    @IBOutlet weak var highTemp: UILabel!
    @IBOutlet weak var lowTemp: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    
    
    func configureCell(forecast: Forecast){
        lowTemp.text = "\(forecast.lowTemp)"
        highTemp.text = "\(forecast.highTemp)"
        weatheType.text = forecast.weatherType
        date.text = forecast.date
        cellImage.image = UIImage(named: "\(forecast.weatherType)-img")
    }

    

}
