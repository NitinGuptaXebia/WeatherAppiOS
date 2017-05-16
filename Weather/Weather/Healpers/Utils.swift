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
    
    /// Setting Up Navigation Controller Attributes
    ///
    /// - Parameter navigationController: navigationController instance
    internal class func customizeNavigation(navigationController: UINavigationController?) {
        guard navigationController != nil else {
            return
        }
        navigationController!.navigationBar.barTintColor = AppColor.PrimaryColor
        navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white, NSFontAttributeName: UIFont.boldSystemFont(ofSize: 16.0)]
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
    internal class func serializeJSONData(data: Data) -> [String:Any]? {
        do {
            let jsonResult = try JSONSerialization.jsonObject(with: data, options:[]) as! [String:Any]
            return jsonResult
        } catch {
            print("ERROR: Unable to Serialize Data to Dict")
        }
        return nil
    }
    
    /// Showing Alert With list of action, In case Actions are nil, It will insert default Cancle button
    ///
    /// - Parameters:
    ///   - title: Alert Title
    ///   - message: Alert Message
    ///   - actions: List of UIAlertAction
    internal class func showAlert(title: String, message: String, actions:[UIAlertAction]?) {
        let vc = (UIApplication.shared.delegate as! AppDelegate).window?.rootViewController
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        if let actionArray = actions {
            for action in actionArray {
                alert.addAction(action)
            }
        } else {
            let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alert.addAction(okAction)
        }
        vc?.present(alert, animated: true, completion: nil)
    }
    
    internal static func documentDirectoryPath() -> String {
        return NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
    }
}
