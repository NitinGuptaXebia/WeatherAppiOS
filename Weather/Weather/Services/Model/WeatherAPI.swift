//
//  WeatherAPI.swift
//  Weather
//
//  Created by NitinGupta on 16/05/17.
//  Copyright © 2017 NitinGupta. All rights reserved.
//

import Foundation

class WeatherAPI: APIBase {
    required internal override init() {
        super.init()
        self.methodName = "/weather"
    }
    
    /// Fecthing Weather API
    ///
    /// - Parameters:
    ///   - lat: Latitude
    ///   - long: Longitude
    ///   - unit: TempratureUnit
    func getWeather(forLatitude lat: Double, Longitude long: Double, TempratureUnit unit: String) -> Void {
        let urlPath = APIConfigurations.baseURLString + methodName!
        let paramString = "?lat=\(lat)&lon=\(long)&appid=\(APIConfigurations.AppId)&units=\(unit)"
        let request = Request(urlPath + paramString)
        request.execute { (response, error) in
            self.callback?(response)
        }
    }


}
