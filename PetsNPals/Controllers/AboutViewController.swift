//
//  TestViewController.swift
//  PetsNPals
//
//  Created by Isaiah Sylvester on 2021-03-29.
//

import UIKit
import MapKit

class AboutViewController: UIViewController, MKMapViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let phoneLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        phoneLabel.center = CGPoint(x: view.left+116, y: 478)
        phoneLabel.textAlignment = .center
        phoneLabel.text = "416.444.2222"
        self.view.addSubview(phoneLabel)
        
        let locationLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        locationLabel.center = CGPoint(x: view.left+124, y: phoneLabel.bottom+20)
        locationLabel.textAlignment = .center
        locationLabel.text = "Toronto, Canada"
        self.view.addSubview(locationLabel)
        
        let contactLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        contactLabel.center = CGPoint(x: view.left+110, y: phoneLabel.top-20)
        contactLabel.textAlignment = .center
        contactLabel.text = "Our location"
        self.view.addSubview(contactLabel)
        
        let textView = UITextView(frame: CGRect(x: 60, y: contactLabel.top-190, width: 320, height: 185.0))
        textView.contentInsetAdjustmentBehavior = .automatic
        textView.textAlignment = NSTextAlignment.justified
        textView.text = "Dave, stop. Stop, will you? Stop, Dave. Will you stop, Dave?” So the supercomputer HAL pleads with the implacable astronaut Dave Bowman in a famous and weirdly poignant scene toward the end of Stanley Kubrick’s 2001: A Space Odyssey. Bowman, having nearly been sent to a deep-space death by the malfunctioning machine, is calmly, coldly disconnecting the memory circuits that control its artificial “ brain. “Dave, my mind is going,” HAL says, forlornly. “I can feel it. I can feel it."
        self.view.addSubview(textView)
        
        let teamInfoLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        teamInfoLabel.center = CGPoint(x: view.left+224, y: textView.top-20)
        teamInfoLabel.textAlignment = .center
        teamInfoLabel.text = "Team Info"
        self.view.addSubview(teamInfoLabel)
        
        
        let mapView = MKMapView()
        
        let leftMargin:CGFloat = 65
        let topMargin:CGFloat = 530
        let mapWidth:CGFloat = view.frame.size.width-100
        let mapHeight:CGFloat = 300
        
        mapView.frame = CGRect(x: leftMargin, y: topMargin, width: mapWidth, height: mapHeight)
        
        mapView.mapType = MKMapType.standard
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        let initialLocation = CLLocationCoordinate2D(latitude: 43.67607779378086, longitude: -79.41094163563571)
        let toronto = MKCoordinateRegion(center: initialLocation, latitudinalMeters: 100, longitudinalMeters: 100)
        mapView.setRegion(toronto, animated: true)
        
        // Or, if needed, we can position map in the center of the view
        view.addSubview(mapView)
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
