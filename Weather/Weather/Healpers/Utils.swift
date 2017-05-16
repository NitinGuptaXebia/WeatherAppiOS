//
//  Utils.swift
//  Weather
//
//  Created by NitinGupta on 16/05/17.
//  Copyright © 2017 NitinGupta. All rights reserved.
//

import Foundation
import UIKit

class Utils {
    
    /// Delay Util Async Main thread util function
    ///
    /// - Parameters:
    ///   - seconds: value in Sec
    ///   - completion: completion block called after delay
    internal class func performWithDelay(seconds: Double, completion:@escaping ()->()) {
        let when = DispatchTime.now() + seconds
        DispatchQueue.main.asyncAfter(deadline: when) {
            completion()
        }
    }
    
    /// Getting String for Tempratature Type
    ///
    /// - Parameter type: Tempratature Unit Type
    /// - Returns: String for Tempratature Type
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
    
    /// Setting Up Navigation Controller Attributes
    ///
    /// - Parameter navigationController: navigationController instance
    internal class func customizeNavigation(navigationController: UINavigationController?) {
        guard navigationController != nil else {
            return
        }
        navigationController!.navigationBar.barTintColor = AppColor.PrimaryColor
        navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white, NSFontAttributeName: UIFont.systemFont(ofSize: 16.0)]
        navigationController!.navigationBar.isTranslucent = false
        navigationController!.navigationBar.tintColor = UIColor.white
        navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController!.navigationBar.shadowImage = UIImage()
    }
    
    /// Setting Up Custom Application Statusbar
    internal class func setUpCustomStatusbar() {
        let aView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 20))
        aView.backgroundColor = AppColor.PrimaryColor
        (UIApplication.shared.delegate as? AppDelegate)?.window?.rootViewController?.view .addSubview(aView)
    }
    
    /// It simply Serialize JSON Data to [[String:Any]]
    ///
    /// - Parameter data: Url Response Data
    /// - Returns: return value [[String:Any]]
    internal class func serializeJSONData(data: Data) -> [[String:Any]]? {
        do {
            let jsonResult = try JSONSerialization.jsonObject(with: data, options:[]) as! [[String:Any]]
            return jsonResult
        } catch {
            print("ERROR: Unable to Serialize Data to Dict")
        }
        return nil
    }
}
