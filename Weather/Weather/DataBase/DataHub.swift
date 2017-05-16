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
    var isLoggedIn = false

    internal class var sharedInstance: DataHub {
        struct Singleton {
            static let instance = DataHub()
        }
        return Singleton.instance
    }

    func addAnnotation(annotation: Annotation) -> Void {
        annotationsArray?.append(annotation)
        saveData()
    }
    
    func removeAnnotation(index: Int) -> Void {
        annotationsArray?.remove(at: index)
        saveData()
    }

    func saveData() -> Void {
        guard annotationsArray != nil && (annotationsArray?.count)! > 0 else {
            return
        }
        
        let finalArray = NSMutableArray()
        for annotation in annotationsArray! {
            let dict = annotation.encodeToDictionaryRepresentation()
            finalArray.add(dict)
        }
        
        let path = dataFilePath()
        let _ = finalArray.write(toFile: path, atomically: true)
    }
    
    //Mark: Private Functions
    private init() {
        initialisingDataHub()
    }
    
    private func initialisingDataHub() {
        annotationsArray = Array()
        let path = dataFilePath()
        if let savedArray = NSArray(contentsOfFile: path) {
            for dict in savedArray {
                let annotation = Annotation(withDictionary: dict as! NSDictionary)
                addAnnotation(annotation: annotation)
            }
        }
    }
    
    
    private func dataFilePath() -> String {
        return Utils.documentDirectoryPath() + "/data.plist"
    }
    
}
