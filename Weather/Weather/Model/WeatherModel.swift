//
//  WeatherModel.swift
//  Weather
//
//  Created by NitinGupta on 16/05/17.
//  Copyright © 2017 NitinGupta. All rights reserved.
//

import Foundation

class WeatherModel {
    private(set) var temperature: Float?
    
    private(set) var weather: String?
    private(set) var windSpeed: Float?
    private(set) var minTemp: Float?
    private(set) var humidity:Float?
    private(set) var maxTemp: Float?
    private(set) var pressure:Float?
    private(set) var elevation:Float?
    
    
    init(dictionary: [String : AnyObject]) {
        if let weatherDesc = dictionary["weather"] as? [[String:AnyObject]]{
            if let weatherCond = weatherDesc.first?["description"] as? String{
                weather = weatherCond
            }
        }
        if let main = dictionary["main"] as? [String:AnyObject] {
            if let temp = main["temp"] as? Float {
                temperature = temp
            }
            if let press = main["pressure"] as? Float {
                pressure = press
            }
            if let humid = main["humidity"] as? Float {
                humidity = humid
            }
            if let min = main["temp_min"] as? Float {
                minTemp = min
            }
            
            if let max = main["temp_max"] as? Float {
                maxTemp = max
            }
            if let height = main["sea_level"] as? Float {
                elevation = height
            }
        }
        
        if let wind = dictionary["wind"]?["speed"] as? Float {
            windSpeed = wind
        }
        
    }
    
}
