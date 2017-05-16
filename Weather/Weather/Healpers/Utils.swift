//
//  Utils.swift
//  Weather
//
//  Created by NitinGupta on 16/05/17.
//  Copyright © 2017 NitinGupta. All rights reserved.
//

import Foundation

class Utils {
    
    internal class func performWithDelay(seconds: Double, completion:@escaping ()->()) {
        let when = DispatchTime.now() + seconds
        DispatchQueue.main.asyncAfter(deadline: when) {
            completion()
        }
    }
    
    internal class func getTempratureUnitKey(forType type: TempratureUnitType) -> String {
        switch type {
        case .Celsius:
            return "Metric"
        case .Fahrenheit:
            return "Imperial"
        case .Kelvin:
            return "Default"
        }
    }
}
