//
//  CurrentWeather.swift
//  Rainy
//
//  Created by Loyd Vallot on 5/29/17.
//  Copyright © 2017 Loyd's Productions. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeather{
    
    var _cityname: String!
    var _date: String!
    var _weatherType: String!
    var _currentTemp: Double!
    
    var cityname: String{
        if _cityname == nil
        {
            _cityname = ""
        }
        return _cityname
    }
    
    var date: String{
        if _date == nil
        {
            _date = ""
        }
        let dateformatter = DateFormatter()
        dateformatter.dateStyle = .long
        dateformatter.timeStyle = .none
        let currentDate = dateformatter.string(from: Date())
        self._date = " Today, \(currentDate)"
        
        return _date
    }

    
    var weatherType: String{
        if _weatherType == nil
        {
            _weatherType = ""
        }
        return _weatherType
    }

    
    var currentTemp: Double{
        if _currentTemp == nil
        {
            _currentTemp = 0.0
        }
        return _currentTemp
    }

    
    func downloadWeatherDetails(completed: @escaping DownloadComplete){
        //Alamofire download
        let currentWeatherURL = URL(string: Curr_Weather_URL)!
        //Pulling info for server
        Alamofire.request(currentWeatherURL).responseJSON { response in
            let result = response.result
            
            //accessing name dictionary to get city name
            if let dict = result.value as? Dictionary<String, AnyObject>
            {
                if let name = dict["name"] as? String{
                    self._cityname = name.capitalized
                    print(self._cityname)
                }
                
                //accessing weather dictionary tp get weather type
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>] /*weather is an array of dictionaries*/
                {   //accessing
                    if let main = weather[0]["main"] as? String{
                        self._weatherType = main.capitalized
                        print(self._weatherType)
                    }
                    
                }
                
                //accessing dictionary of "main" to get weather temp
                if let main = dict["main"] as? Dictionary<String, AnyObject> {
                    
                    if let currentTemprature = main ["temp"] as? Double {
                        let kelvintoFarnpre = (currentTemprature * (9/5) - 459.67)
                        let kelvintoFarn = Double(round(10 * kelvintoFarnpre/10))
                        self._currentTemp = kelvintoFarn
                        print(self._currentTemp)
                        
                    }
                    
                }
            }
            completed()
        }
        
    
    }
    
}

