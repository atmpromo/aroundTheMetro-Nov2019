//
//  Constants.swift
//  Login-ATM
//
//  Created by Siamak Eshghi on 2017-12-19.
//  Copyright © 2017 SiamakEshghi. All rights reserved.
//

import Foundation
import UIKit


struct Constants{
    //API Level
    
    static let BANNER_ADS_UNIT_ID = "ca-app-pub-5420876778958572/4194336391"
    
    static let ATM_WEB_ADDRESS = "http://aroundthemetro.com"
    

    static let API_URL_PRODUCTION = NSLocalizedString("http://montrealsouterrain.com/api/", comment: "myurl")
   
    static let API_URL_BASE = NSLocalizedString("http://aroundthemetro.com/api", comment: "myurl")
    static let BANNER_IMAGE_URL = NSLocalizedString("http://aroundthemetro.com//assets/images/BannerImages/", comment: "bannerUrl")
    
//    static let API_URL_DEVELOPMENT = NSLocalizedString("\(API_URL_BASE)\(Public.CountryName)/\(Public.CityName)", comment: "myurl")
    
    
 
  
    static let titles = ["Home","My Profile","Change City","Contact us"]
    static let titlesImages: [String] = ["home-icon", "profile-icon","city-icon","contactus-icon"]
    
    static let menu_titles = [
        "Metro Plan",
        "AR View",
        "Restaurants",
        "Boutiques",
        "Beauty & Health",
        "Attractions"]
  
    static let proximiioEmail = "elias@montrealsouterrain.ca"
    static let proximiioPassword = "password"
}
