//
//  TestViewController.swift
//  PetsNPals
//
//  Created by Isaiah Sylvester on 2021-03-29.
//

import UIKit
import MapKit

class AboutViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        mapView?.mapType = MKMapType.standard
        mapView?.isZoomEnabled = true
        mapView?.isScrollEnabled = true
        let initialLocation = CLLocationCoordinate2D(latitude: 43.67605275902866, longitude: -79.41075575302779)
        let toronto = MKCoordinateRegion(center: initialLocation, latitudinalMeters: 100, longitudinalMeters: 100)
        mapView?.setRegion(toronto, animated: true)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
 
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
