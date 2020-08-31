//
//  ViewController.swift
//  MapTask
//
//  Created by Sose Yeritsyan on 7/28/20.
//  Copyright © 2020 addevice.kkk. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, UIGestureRecognizerDelegate, MKMapViewDelegate {
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var myGesture: UITapGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myGesture.delegate = self
        myGesture.numberOfTouchesRequired = 1
        myGesture.numberOfTapsRequired = 2
        self.mapView.addGestureRecognizer(myGesture)

        
    }
    
    
//    my custom double tap works
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    @IBAction func tapPiece(_ gestureRecognizer : UITapGestureRecognizer ) {
        let touchLocation = gestureRecognizer.location(in: mapView)
        let locationCoordinate = mapView.convert(touchLocation, toCoordinateFrom: mapView)
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        vc.lastTappedLocation = SecondModel(lattitude: locationCoordinate.latitude, longtitude: locationCoordinate.longitude)
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
      
}
