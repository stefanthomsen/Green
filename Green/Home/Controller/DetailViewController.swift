//
//  DetailViewController.swift
//  Green
//
//  Created by Stefan Thomsen on 21/08/18.
//  Copyright © 2018 CreativeDev. All rights reserved.
//

import UIKit
import MapKit

class DetailViewController: UIViewController {
    @IBOutlet weak var mapView:MKMapView!
    
    var image:UIImage?
    let regionRadius: CLLocationDistance = 1000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let initialLocation = CLLocation(latitude: 21.282778, longitude: -157.829444)
        centerMapOnLocation(location: initialLocation)
        self.addAnnotation()
    }
    
    func addAnnotation(){
        let london = MKPointAnnotation()
        london.title = "Moped"
        london.coordinate = CLLocationCoordinate2D(latitude: 21.282778, longitude: -157.829444)
        mapView.addAnnotation(london)
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius, regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    
}

extension DetailViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "MyPin"
        
        if annotation is MKUserLocation {
            return nil
        }
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
            if let image = image{
                annotationView?.image = image.resizeImage(80, opaque: false)
            }
        } else {
            annotationView?.annotation = annotation
        }
        
        return annotationView
    }
}
