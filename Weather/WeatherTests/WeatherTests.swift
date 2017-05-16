//
//  WeatherTests.swift
//  WeatherTests
//
//  Created by NitinGupta on 16/05/17.
//  Copyright © 2017 NitinGupta. All rights reserved.
//

import XCTest
import CoreLocation
@testable import Weather

class WeatherTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testDataHubInit() -> Void {
        let _ = DataHub.sharedInstance.removeAnnotation(index: 10)
        DataHub.sharedInstance.removeAnnotation(index: 0)
        
    }
    
    func testAnnotation() -> Void {
        let cor = CLLocationCoordinate2D(latitude: 10, longitude: 0)
        let _ = Annotation(withCoordinate: cor)
    }
    
    func testUtils() -> Void {
        Utils.customizeNavigation(navigationController: nil)
        Utils.setUpCustomStatusbar()
        let _ = Utils.serializeJSONData(data: Data())
        Utils.showAlert(title: "", message: "", actions: nil)
        
        let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        Utils.showAlert(title: "", message: "", actions: [okAction])
    }
    
    func testViewController() -> Void {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        let detailVC = storyBoard.instantiateViewController(withIdentifier: "WeatherDetailViewController") as! WeatherDetailViewController
        let _ = detailVC.view // force loading subviews and setting outlets
        detailVC.viewDidLoad()
        detailVC.viewWillAppear(false)
        detailVC.viewDidDisappear(false)
        detailVC.didReceiveMemoryWarning()

        let loginVC = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        let _ = loginVC.view // force loading subviews and setting outlets
        loginVC.viewDidLoad()
        loginVC.viewWillAppear(false)
        loginVC.viewDidDisappear(false)
        loginVC.didReceiveMemoryWarning()

        
        let hvc = storyBoard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        let _ = hvc.view // force loading subviews and setting outlets
        hvc.viewDidLoad()
        hvc.viewWillAppear(false)
        hvc.viewDidDisappear(false)
        hvc.didReceiveMemoryWarning()

        
        let wvc = storyBoard.instantiateViewController(withIdentifier: "WeatherDetailViewController") as! WeatherDetailViewController
        let _ = wvc.view // force loading subviews and setting outlets
        wvc.viewDidLoad()
        wvc.viewWillAppear(false)
        wvc.viewDidDisappear(false)
        wvc.didReceiveMemoryWarning()
        
        let cor = CLLocationCoordinate2D(latitude: 10, longitude: 0)
        let annotation = Annotation(withCoordinate: cor)
        annotation.title = "Nitin"
        annotation.subtitle = "Nitin"
        wvc.annotation = annotation
        let _ = wvc.view // force loading subviews and setting outlets
        wvc.viewDidLoad()
        wvc.viewWillAppear(false)
        wvc.viewDidDisappear(false)
        wvc.didReceiveMemoryWarning()
        


        let mvc = storyBoard.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
        
        let _ = mvc.view // force loading subviews and setting outlets
        mvc.viewDidLoad()
        mvc.viewWillAppear(false)
        mvc.viewDidDisappear(false)
        mvc.didReceiveMemoryWarning()

        let helpvc = storyBoard.instantiateViewController(withIdentifier: "HelpViewController") as! HelpViewController
        let _ = helpvc.view // force loading subviews and setting outlets
        helpvc.viewDidLoad()
        helpvc.viewWillAppear(false)
        helpvc.viewDidDisappear(false)
        helpvc.didReceiveMemoryWarning()

        let svc = storyBoard.instantiateViewController(withIdentifier: "SettingsViewController") as! SettingsViewController
        let _ = svc.view // force loading subviews and setting outlets
        svc.viewDidLoad()
        svc.viewWillAppear(false)
        svc.viewDidDisappear(false)
        svc.didReceiveMemoryWarning()

        svc.showActivityIndicator(superView: svc.view)
        svc.hideActivityIndicator(superView: svc.view)
    }
    
    func testConstant() -> Void {
        let _  = TempratureUnitType.Celsius
        let _ = TempratureUnitType.getTempratureUnitKey(forType: TempratureUnitType(rawValue: 0)!)
        let _ = TempratureUnitType.getTemperatureUnit(forType: TempratureUnitType(rawValue: 0)!)
        let _ = TempratureUnitType.getTemperatureTypeString(forType: TempratureUnitType(rawValue: 0)!)
        
        let _ = TempratureUnitType.getTempratureUnitKey(forType: TempratureUnitType(rawValue: 1)!)
        let _ = TempratureUnitType.getTemperatureUnit(forType: TempratureUnitType(rawValue: 1)!)
        let _ = TempratureUnitType.getTemperatureTypeString(forType: TempratureUnitType(rawValue: 1)!)
        
        let _ = TempratureUnitType.getTempratureUnitKey(forType: TempratureUnitType(rawValue: 2)!)
        let _ = TempratureUnitType.getTemperatureUnit(forType: TempratureUnitType(rawValue: 2)!)
        let _ = TempratureUnitType.getTemperatureTypeString(forType: TempratureUnitType(rawValue: 2)!)
    }
    
    func testForcastAPI() -> Void {
        let fAPI = ForecastAPI()
        fAPI.callback = { respose in
            // TODO
        }
        var unit = UserDefaults.standard.object(forKey: UserDefaultKeys.TemperaturUnitKey)
        unit = unit == nil ? "Metric" : unit
        fAPI.getForecast(forLatitude: 0 , Longitude: 0, TempratureUnit: unit as! String)

    }
}
