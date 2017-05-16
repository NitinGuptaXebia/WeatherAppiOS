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
    var title: String?
    var subtitle: String?
    
    init(withCoordinate coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
}
