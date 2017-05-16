//
//  APIClient.swift
//  Weather
//
//  Created by NitinGupta on 16/05/17.
//  Copyright © 2017 NitinGupta. All rights reserved.
//

import Foundation

public class APIBase {
    internal var callback : ((_ response: AnyObject?) -> Void)?
    internal var methodName : String?
}

class Request: NSObject {
    private var urlString: String?
    var session: URLSession!
    private var callback : ((_ response: AnyObject?, _ error: NSError?) -> Void)?
    
    convenience internal init(_ urlString: String) {
        self.init()
        self.urlString = urlString
        self.callback = nil
        let configuration = URLSessionConfiguration.default
        self.session = URLSession(configuration: configuration, delegate: nil, delegateQueue:OperationQueue.main)
        
    }

    /// Execute Request Function
    ///
    /// - Parameter completion: completion Block
    func execute(completion: @escaping (AnyObject?,NSError?) -> Void) {
        let myUrlString = self.urlString
        let requestURL : URL! = URL(string:myUrlString!)
        
        // Create URL Request
        let request = NSMutableURLRequest(url:requestURL! as URL);
        request.httpMethod = "GET"
        request.timeoutInterval = Double(APIConfigurations.timeOutInterval)
        
        // Excute HTTP Request
        let task = self.session.dataTask(with: request as URLRequest) { (data, response, error) in
            if data == nil {
                print("ERROR: \(error!) \(error!.localizedDescription)")
                completion(nil, error as NSError?)
            } else {
                let responseDict = Utils.serializeJSONData(data: data!)
                completion(responseDict as AnyObject, nil)
            }
        }
        task.resume()
    }
    
}
