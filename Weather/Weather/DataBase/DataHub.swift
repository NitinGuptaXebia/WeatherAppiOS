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

    /// Adding Annotation to DB
    ///
    /// - Parameter annotation: annotation object
    func addAnnotation(annotation: Annotation) -> Void {
        annotationsArray?.append(annotation)
        saveData()
    }
    
    /// Removing Annotation to DB
    ///
    /// - Parameter annotation: annotation object
    func removeAnnotation(index: Int) -> Void {
        guard index < (annotationsArray?.count)! else {
            return
        }
        annotationsArray?.remove(at: index)
        saveData()
    }

    /// Saving Annotation to DB
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
    
    /// Initialising DataHub Annotation to DB
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
    
    
    /// Document Directory Path for Data PLIST
    ///
    /// - Returns: path String
    private func dataFilePath() -> String {
        return Utils.documentDirectoryPath() + "/data.plist"
    }
    
}
