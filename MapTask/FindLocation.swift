//
//  FindLocationClass.swift
//  MapTask
//
//  Created by Sose Yeritsyan on 7/28/20.
//  Copyright © 2020 addevice.kkk. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class FindLocation {
    
    static let sharedInstance = FindLocation()
    private init() {}
    func getLocation(requestURL: String, taskCallback: @escaping (SecondModel?, Error?) -> ()){
            AF.request(requestURL).responseJSON(completionHandler: {(response) in
                
                if response.error != nil {
                print("RESPONSE ERROR")
                taskCallback(nil, response.error)
            } else if response.value != nil {
                
                let locationJson = JSON(response.value as Any)

                let timezone = locationJson["timezone"].number as! Double
                let country = locationJson["sys"]["country"].stringValue
                let name = locationJson["name"].stringValue
                let lat = locationJson["coord"]["lat"].number as! Double
                let lon = locationJson["coord"]["lon"].number as! Double

                
                let info = SecondModel(timezone: timezone, country: country, name: name, lattitude: lat, longtitude: lon)
                    
                taskCallback(info, nil)
                
                } else {
                taskCallback(nil, nil)
            }
        })
    }
    
}
