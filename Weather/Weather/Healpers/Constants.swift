//
//  Constants.swift
//  Weather
//
//  Created by NitinGupta on 16/05/17.
//  Copyright © 2017 NitinGupta. All rights reserved.
//

import Foundation
import UIKit

//Unit Default: Kelvin, Metric: Celsius, Imperial: Fahrenheit
enum TempratureUnitType : Int {
    case Kelvin = 0
    case Celsius = 1
    case Fahrenheit = 2
}

struct AppColor {
    static let PrimaryColor = UIColor(colorLiteralRed: 0.0/255.0, green: 102/255.0, blue: 161/255.0, alpha: 1.0)
    static let SecondaryColor = UIColor(colorLiteralRed: 181.0/255.0, green: 84/255.0, blue: 53/255.0, alpha: 1.0)
}
