//
//  WeatherDetailViewController.swift
//  Weather
//
//  Created by NitinGupta on 16/05/17.
//  Copyright © 2017 NitinGupta. All rights reserved.
//

import UIKit

class WeatherDetailViewController: MasterViewController {

    var annotation: Annotation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getWeatherData()
    }

    func getWeatherData() -> Void {
        var unit = UserDefaults.standard.object(forKey: UserDefaultKeys.TemperaturUnitKey)
        unit = unit == nil ? "Metric" : unit
        guard annotation != nil else {
            return
        }
        fetchWeather(forLatitude: (annotation?.coordinate.latitude)!, Longitude: (annotation?.coordinate.longitude)!, TempratureUnit: unit as! String)
    }
    
    func fetchWeather(forLatitude lat: Double, Longitude long: Double, TempratureUnit unit: String) {
        let weatherAPI = WeatherAPI()
        weatherAPI.callback = { respose in
            // TODO
        }
        weatherAPI.getWeather(forLatitude: lat, Longitude: long, TempratureUnit: unit)
    }


}
