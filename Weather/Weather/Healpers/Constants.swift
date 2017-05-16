//
//  Constants.swift
//  Weather
//
//  Created by NitinGupta on 16/05/17.
//  Copyright © 2017 NitinGupta. All rights reserved.
//

import Foundation
import UIKit

struct UserDefaultKeys {
    static let TemperaturUnitKey = "TemperaturUnitKey"
}

//Unit Default: Kelvin, Metric: Celsius, Imperial: Fahrenheit
enum TempratureUnitType : Int {
    case Kelvin = 0
    case Celsius = 1
    case Fahrenheit = 2
    internal static func getTempratureUnitKey(forType type: TempratureUnitType) -> String {
        switch type {
        case .Celsius:
            return "Metric"
        case .Fahrenheit:
            return "Imperial"
        case .Kelvin:
            return "Default"
        }
    }
    
    internal static func getTemperatureTypeString(forType type: TempratureUnitType) -> String {
        switch type {
        case .Celsius:
            return "Celsius"
        case .Fahrenheit:
            return "Fahrenheit"
        case .Kelvin:
            return "Kelvin"
        }
    }
    
    internal static func getTemperatureUnit(forType type: TempratureUnitType) -> String {
        switch type {
        case .Celsius:
            return "°C"
        case .Fahrenheit:
            return "°F"
        case .Kelvin:
            return "K"
        }
    }
    
}

struct AppColor {
    static let PrimaryColor = UIColor(colorLiteralRed: 0.0/255.0, green: 102/255.0, blue: 161/255.0, alpha: 1.0)
    static let SecondaryColor = UIColor(colorLiteralRed: 181.0/255.0, green: 84/255.0, blue: 53/255.0, alpha: 1.0)
}

struct APIConfigurations {
    static let baseURLString = "http://api.openweathermap.org/data/2.5"
    static let timeOutInterval = 180
    static let AppId = "09010431c87889b1be4d9aa25b88f604"
}
