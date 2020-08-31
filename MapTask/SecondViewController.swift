//
//  SecondViewController.swift
//  MapTask
//
//  Created by Sose Yeritsyan on 7/29/20.
//  Copyright © 2020 addevice.kkk. All rights reserved.
//

import UIKit
import Network


class SecondViewController: UIViewController {
  
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timezoneLabel: UILabel!
    @IBOutlet weak var latLabel: UILabel!
    @IBOutlet weak var lonLabel: UILabel!

    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "Monitor")
    var lastTappedLocation = SecondModel()
    
    let locationURLStart = "http://api.openweathermap.org/data/2.5/weather?lat="
    let locationURLMiddle = "&lon="
    let locationURLEnd = "&appid=78768abda974ecbd64d6f70b441bcd8d"
    var locationURL: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationURL = locationURLStart + String(lastTappedLocation.lattitude) + locationURLMiddle + String(lastTappedLocation.longtitude) + locationURLEnd
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                var secondViewModel = SecondViewModel()
//                FindLocation.sharedInstance.getLocation(requestURL: locationURL) { (result, error) in
//                    if result != nil {
//                        CoreDataManager.sharedManager.insertLocation(location: result!)
                //secondViewModel.showLocation(url: self.locationURL)
                secondViewModel.configure(self)
//                self.secondViewModel.configure(self)
//                    }
//                }

            } else {
                print("No connection.")
                self.locationURL = nil
//                let showLocation = CoreDataManager.sharedManager.getLocation(myLocation: self.lastTappedLocation)
//                self.secondViewModel = SecondViewModel(model: showLocation)
//                self.secondViewModel.configure(self)
                
            }

        }
        monitor.start(queue: queue)
//        self.secondViewModel.configure(self)

    }
        
}
