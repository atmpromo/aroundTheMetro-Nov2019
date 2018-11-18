//
//  Country.swift
//  Login-ATM
//
//  Created by Siamak Eshghi on 2017-12-20.
//  Copyright © 2017 SiamakEshghi. All rights reserved.
//

import Foundation

public class Country {
    var country: String
    var cities: [String]
    
    init(country:String,cities:[String]) {
        self.cities = cities
        self.country = country
    }
}
