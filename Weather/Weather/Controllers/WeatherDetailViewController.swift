//
//  WeatherDetailViewController.swift
//  Weather
//
//  Created by NitinGupta on 16/05/17.
//  Copyright © 2017 NitinGupta. All rights reserved.
//

import UIKit

class WeatherDetailViewController: MasterViewController {
    
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var minMaxTempLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var elevationLabel: UILabel!

    @IBOutlet weak var forecastTableView: UITableView!
    
    var annotation: Annotation?

    var weatherModel:WeatherModel?
    var forecastModel:ForecastModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = (annotation?.title!)! + " Weather Report"
        showActivityIndicator(superView: (self.navigationController?.view)!)
        getWeatherData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// Getting Weather Data
    private func getWeatherData() -> Void {
        var unit = UserDefaults.standard.object(forKey: UserDefaultKeys.TemperaturUnitKey)
        unit = unit == nil ? "Metric" : unit
        guard annotation != nil else {
            return
        }
        fetchWeather(forLatitude: (annotation?.coordinate.latitude)!, Longitude: (annotation?.coordinate.longitude)!, TempratureUnit: unit as! String)
    }
    
    /// Fecthing Weather API
    ///
    /// - Parameters:
    ///   - lat: Latitude
    ///   - long: Longitude
    ///   - unit: TempratureUnit
    private func fetchWeather(forLatitude lat: Double, Longitude long: Double, TempratureUnit unit: String) {
        let weatherAPI = WeatherAPI()
        weatherAPI.callback = { respose in
            if respose != nil  {
                self.weatherModel = WeatherModel(dictionary: respose as! [String : AnyObject])
                self.setUpView()
                self.getForecastData()
            } else {
                self.hideActivityIndicator(superView: (self.navigationController?.view)!)
                
            }
        }
        weatherAPI.getWeather(forLatitude: lat, Longitude: long, TempratureUnit: unit)
    }

    /// Getting Forecast Data
    private func getForecastData() -> Void {
        var unit = UserDefaults.standard.object(forKey: UserDefaultKeys.TemperaturUnitKey)
        unit = unit == nil ? "Metric" : unit
        guard annotation != nil else {
            return
        }
        fetchForecast(forLatitude: (annotation?.coordinate.latitude)!, Longitude: (annotation?.coordinate.longitude)!, TempratureUnit: unit as! String)
    }
    
    /// Fecthing Forecast API
    ///
    /// - Parameters:
    ///   - lat: Latitude
    ///   - long: Longitude
    ///   - unit: TempratureUnit
    private func fetchForecast(forLatitude lat: Double, Longitude long: Double, TempratureUnit unit: String) {
        let forecastAPI = ForecastAPI()
        forecastAPI.callback = { respose in
            if respose != nil  {
                self.forecastModel = ForecastModel(dictionary: respose as! [String : AnyObject])
                self.forecastTableView.reloadData()
            } else {
                
            }
            self.hideActivityIndicator(superView: (self.navigationController?.view)!)
        }
        forecastAPI.getForecast(forLatitude: lat, Longitude: long, TempratureUnit: unit)
    }
    

    /// Setting Up View
    private func setUpView(){
        if weatherModel != nil{
            temperatureLabel.text = weatherModel!.temperature!.description
            weatherLabel.text = weatherModel!.weather
            minMaxTempLabel.text = "\(weatherModel!.maxTemp!.description)/\(weatherModel!.minTemp!.description)"
            windLabel.text = weatherModel?.windSpeed?.description
            pressureLabel.text = weatherModel?.pressure?.description
            humidityLabel.text = weatherModel?.humidity?.description
            elevationLabel.text = weatherModel?.elevation?.description
        }
    }
    
    private func showNoDataAlert() {
        let cancleAction = UIAlertAction.init(title: "Move Back", style: .cancel, handler: { (action) in
            self.navigationController?.popViewController(animated: true)
        })
        let message = "Unable to fetch Weather Information, Please try again."
        let title = "Oops!!"
        Utils.showAlert(title: title, message: message, actions: [cancleAction])
    }
    
}

extension WeatherDetailViewController :UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        guard forecastModel != nil else {
            return 0
        }
        return (forecastModel?.forecastArray.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "forecastCell", for: indexPath)
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        let result = formatter.string(from: forecastModel!.forecastArray[indexPath.row].date!)
        cell.textLabel?.text = String(describing: result)
        cell.detailTextLabel?.text = "\(forecastModel!.forecastArray[indexPath.row].maxTemp!)/\(forecastModel!.forecastArray[indexPath.row].minTemp!)"
        return cell
    }
}

