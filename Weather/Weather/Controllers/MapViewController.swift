//
//  MapViewController.swift
//  Weather
//
//  Created by NitinGupta on 16/05/17.
//  Copyright © 2017 NitinGupta. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: MasterViewController {

    @IBOutlet weak var mapView: MKMapView!

    //MARK: View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setLongPressGesture()
        self.title = "Pin Your Location"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: Private Functions
    private func setLongPressGesture() -> Void {
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(addAnnotationOnLongPress(gesture:)))
        longPressGesture.minimumPressDuration = 0.5
        self.mapView.addGestureRecognizer(longPressGesture)
    }
    
    @objc private func addAnnotationOnLongPress(gesture: UILongPressGestureRecognizer) {
        if gesture.state == .ended {
            showActivityIndicator(superView: (self.navigationController?.view)!)
            let point = gesture.location(in: self.mapView)
            let coordinate = self.mapView.convert(point, toCoordinateFrom: self.mapView)
            let pointAnnotation = MKPointAnnotation()
            pointAnnotation.coordinate = coordinate
            
            let loc = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
            CLGeocoder().reverseGeocodeLocation(loc, completionHandler: { (placemarks, error) in
                if error != nil {
                    Utils.showAlert(title: "ERROR", message: (error?.localizedDescription)!, actions: nil)
                } else {
                    let placemark = placemarks?.first
                    
                    let annotation = Annotation(withCoordinate: coordinate)
                    annotation.title = placemark?.administrativeArea
                    annotation.subtitle = placemark?.country
                    
                    self.hideActivityIndicator(superView: self.view)
                    
                    let cancleAction = UIAlertAction.init(title: "Cancle", style: .cancel, handler: { (action) in
                        self.mapView.removeAnnotation(pointAnnotation)
                    })
                    let confirmAction = UIAlertAction.init(title: "Confirm", style: .default, handler: { (action) in
                        self.mapView.addAnnotation(pointAnnotation)
                        DataHub.sharedInstance.addAnnotation(annotation: annotation)
                    })
                    let message = "Would you like to bookmark this location?"
                    let title = annotation.title! + ", " + annotation.subtitle!
                    Utils.showAlert(title: title, message: message, actions: [cancleAction, confirmAction])
                }
            })
        }
    }
}
