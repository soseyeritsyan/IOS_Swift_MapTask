//
//  SecondView.swift
//  MapTask
//
//  Created by addevice on 7/30/20.
//  Copyright © 2020 addevice.kkk. All rights reserved.
//

import Foundation
import UIKit

class SecondView: UIView {
//    let timezoneLabel: UILabel
//    var countryLabel: UILabel
//    var countryIDLabel: UILabel
    var lattitudeLabel: UILabel
    var longtitudeLabel: UILabel

    
    override init(frame: CGRect) {
        let countryFrame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
//        timezoneLabel = UILabel(frame: countryFrame)
//        countryLabel = UILabel(frame: countryFrame)
//        countryIDLabel = UILabel(frame: countryFrame)
        lattitudeLabel = UILabel(frame: countryFrame)
        longtitudeLabel = UILabel(frame: countryFrame)
        
//        timezoneLabel.frame.origin = CGPoint(x: 20, y: 20)
//        countryLabel.frame.origin = CGPoint(x: 20, y: 40)
//        countryIDLabel.frame.origin = CGPoint(x: 20, y: 60)
        lattitudeLabel.frame.origin = CGPoint(x: 20, y: 80)
        longtitudeLabel.frame.origin = CGPoint(x: 20, y: 100)

        super.init(frame: frame)
//        addSubview(timezoneLabel)
//        addSubview(countryLabel)
//        addSubview(countryIDLabel)
        addSubview(lattitudeLabel)
        addSubview(longtitudeLabel)

    }
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
