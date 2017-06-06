//
//  Forecast.swift
//  Rainy
//
//  Created by Loyd Vallot on 5/30/17.
//  Copyright © 2017 Loyd's Productions. All rights reserved.
//

import UIKit
import Alamofire

class Forecast
{
    var _date: String!
    var _weatherType: String!
    var _highTemp: String!
    var _lowTemp: String!
    
    var date: String
    {
        if _date == nil{
            _date = ""
        }
        return _date
    }
    
    var weatherType: String
    {
        if _weatherType == nil{
            _weatherType = ""
        }
        return _weatherType
    }

    
    var highTemp: String
    {
        if _highTemp == nil{
            _highTemp = ""
        }
        return _highTemp
    }

    
    var lowTemp: String
    {
        if _lowTemp == nil{
            _lowTemp = ""
        }
        return _lowTemp
    }
    
    init(weatherDict: Dictionary<String, AnyObject>){
        if let temp = weatherDict ["temp"] as? Dictionary<String, AnyObject>{
            if let min = temp["min"] as? Double {
                let kelvintoFarnpre = (min * (9/5) - 459.67)
                let kelvintoFarn = Double(round(10 * kelvintoFarnpre/10))
                self._lowTemp = "\(kelvintoFarn)"
            }
            
            if let max = temp["max"] as? Double {
                let kelvintoFarnpre = (max * (9/5) - 459.67)
                let kelvintoFarn = Double(round(10 * kelvintoFarnpre/10))
                self._highTemp = "\(kelvintoFarn)"
            }
        }
        
        if let weather = weatherDict ["weather"] as? [Dictionary<String, AnyObject>]{
            if let main = weather[0]["main"] as? String{
                self._weatherType = main
            }
        }
        
        if let date = weatherDict["dt"] as? Double{
            let unixdate = Date(timeIntervalSince1970: date)
            let dateformatter = DateFormatter()
            dateformatter.dateStyle = .full
            dateformatter.dateFormat = "EEEE"
            dateformatter.timeStyle = .none
            self._date = unixdate.Dayofweek()
        }
    }

        
    

}

extension Date{
    func Dayofweek() -> String{
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "EEEE"
        return dateformatter.string(from: self)
    }
}
