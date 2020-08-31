//
//  SecondViewModel.swift
//  MapTask
//
//  Created by Sose Yeritsyan on 7/29/20.
//  Copyright © 2020 addevice.kkk. All rights reserved.
//

import Foundation
class SecondViewModel {
    
    var myModel : SecondModel?

    init(model: SecondModel? = nil) {
        if let inputModel = model {
            myModel = inputModel
        }
//    return nil
        
    }
    
//    func showLocation(url: String) {
//        FindLocation.sharedInstance.getLocation(requestURL: url) { (result, error) in
//            if result != nil {
//                CoreDataManager.sharedManager.insertLocation(location: result!)
//                self.myModel = result
//            }
//        }
//    }
    
//    func getDataFromCoreData(lastTapped: SecondModel) {
//        if CoreDataManager.sharedManager.getLocation(myLocation: lastTapped) != nil {
//            myModel = CoreDataManager.sharedManager.getLocation(myLocation: lastTapped)!
//        }
//    }

    func configure(_ view: SecondViewController) {
        if view.locationURL != nil {
            FindLocation.sharedInstance.getLocation(requestURL: view.locationURL!) { (result, error) in
            if result != nil {
                CoreDataManager.sharedManager.insertLocation(location: result!)
                self.myModel = result

                view.timezoneLabel.text = String(self.myModel!.timezone)
                view.countryLabel.text = self.myModel!.country
                view.nameLabel.text = String(self.myModel!.name)
                view.latLabel.text = String(self.myModel!.lattitude)
                view.lonLabel.text = String(self.myModel!.longtitude)
                
            } else if CoreDataManager.sharedManager.getLocation(myLocation: view.lastTappedLocation) != nil {
                
                self.myModel = CoreDataManager.sharedManager.getLocation(myLocation: view.lastTappedLocation)!
                view.timezoneLabel.text = String(self.myModel!.timezone)
                view.countryLabel.text = self.myModel!.country
                view.nameLabel.text = String(self.myModel!.name)
                view.latLabel.text = String(self.myModel!.lattitude)
                view.lonLabel.text = String(self.myModel!.longtitude)
            } else {
                
                view.timezoneLabel.text = "none"
                view.countryLabel.text = "none"
                view.nameLabel.text = "none"
                view.latLabel.text = "none"
                view.lonLabel.text = "none"
                }
            }
        }
    }
        
}
