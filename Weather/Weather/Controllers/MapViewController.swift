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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: Private Functions
    private func setLongPressGesture() -> Void {
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(addAnnotationOnLongPress(gesture:)))
        longPressGesture.minimumPressDuration = 1.0
        self.mapView.addGestureRecognizer(longPressGesture)
    }
    
    @objc private func addAnnotationOnLongPress(gesture: UILongPressGestureRecognizer) {
        if gesture.state == .ended {
            showActivityIndicator(superView: self.view)
            let point = gesture.location(in: self.mapView)
            let coordinate = self.mapView.convert(point, toCoordinateFrom: self.mapView)
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            
            let loc = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
            CLGeocoder().reverseGeocodeLocation(loc, completionHandler: { (placemarks, error) in
                let placemark = placemarks?.first
                annotation.title = placemark?.administrativeArea
                annotation.subtitle = placemark?.country
                self.mapView.addAnnotation(annotation)
                self.hideActivityIndicator(superView: self.view)
            })
        }
    }
    
    private func placeAnnotationToMap(withCoordinate coordinate: CLLocationCoordinate2D) -> Void {
        var annotation: Annotation? = Annotation(withCoordinate: coordinate)
        mapView.addAnnotation(annotation!)
        mapView.setCenter(coordinate, animated: true)
        annotation = nil
    }

}
