//
//  ForecastModel.swift
//  Weather
//
//  Created by NitinGupta on 16/05/17.
//  Copyright © 2017 NitinGupta. All rights reserved.
//

import Foundation

class ForecastModel {
    private(set) var forecastArray = [WeatherForecastModel]()
    init(dictionary:[String:AnyObject]) {
        if let listArray = dictionary["list"] as? [[String:AnyObject]]{
            for item in listArray{
                forecastArray.append(WeatherForecastModel(dictionary: item))
            }
        }
    }
}

class WeatherForecastModel {
    private(set) var minTemp: Float?
    private(set) var date:Date?
    private(set) var maxTemp: Float?
    
    init(dictionary:[String:AnyObject]) {
        if let main = dictionary["main"] as? [String:AnyObject] {
            if let min = main["temp_min"] as? Float {
                minTemp = min
            }
            
            if let max = main["temp_max"] as? Float {
                maxTemp = max
            }
        }
        if let timeStamp = dictionary["dt"] as? Double{
            date =  Date(timeIntervalSince1970: timeStamp)
        }
        
        
    }
    
}
