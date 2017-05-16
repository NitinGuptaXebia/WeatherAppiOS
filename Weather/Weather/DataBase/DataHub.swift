//
//  DataHub.swift
//  Weather
//
//  Created by NitinGupta on 16/05/17.
//  Copyright © 2017 NitinGupta. All rights reserved.
//

import Foundation

class DataHub {
    
    var annotationsArray : Array<Annotation>?
    
    internal class var sharedInstance: DataHub {
        struct Singleton {
            static let instance = DataHub()
        }
        return Singleton.instance
    }

    func addAnnotation(annotation: Annotation) -> Void {
        annotationsArray?.append(annotation)
    }
    
    func removeAnnotation(index: Int) -> Void {
        annotationsArray?.remove(at: index)
    }

    //Mark: Private Functions
    private init() {
        initialisingDataHub()
    }
    
    private func initialisingDataHub() {
        annotationsArray = Array()
    }
    
    
}
