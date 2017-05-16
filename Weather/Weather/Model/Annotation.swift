//
//  Annotation.swift
//  Weather
//
//  Created by NitinGupta on 16/05/17.
//  Copyright © 2017 NitinGupta. All rights reserved.
//

import Foundation
import MapKit

class Annotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String? = ""
    var subtitle: String? = ""
    
    /// init_Function
    ///
    /// - Parameter coordinate: CLLocationCoordinate2D Object
    init(withCoordinate coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
    
    /// Init Function
    ///
    /// - Parameter dictionary: NSDictionary object
    init(withDictionary dictionary: NSDictionary) {
        let latitude = dictionary.object(forKey: "latitude") as! Double
        let longitude = dictionary.object(forKey: "longitude") as! Double
        self.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        self.title = dictionary.object(forKey: "title") as? String
        self.subtitle = dictionary.object(forKey: "subtitle") as? String
    }
    
    /// Encode to NSDictionary for saving into plist.
    ///
    /// - Returns: NSDictionary object
    func encodeToDictionaryRepresentation() -> NSDictionary {
        let annotationDict = ["latitude":coordinate.latitude,"longitude": coordinate.longitude,"title":title!, "subtitle" : subtitle!] as [String : Any]
        let nsDict = NSDictionary.init(dictionary: annotationDict)
        return nsDict
    }
    
}
