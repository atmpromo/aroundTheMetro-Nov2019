//
//  Place.swift
//  Login-ATM
//
//  Created by Siamak Eshghi on 2018-01-02.
//  Copyright © 2018 SiamakEshghi. All rights reserved.
//

import Foundation
import CoreLocation
import HDAugmentedReality

class ARPlace: ARAnnotation{
    let placeName: String
    let type: String
    var phoneNumber: String?
    var desc: String?
    var googleLink: String?
    var imagename: String?
    
    init(location: CLLocation, type: String, name: String) {
        self.placeName = name
        self.type = type
        
        super.init(identifier: nil, title: nil,location: location)!
        
    }
    
    override var description: String {
        return placeName
    }
}

