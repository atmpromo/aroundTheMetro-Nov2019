//
//  AppDelegateExtensions.swift
//  Login-ATM
//
//  Created by Siamak Eshghi on 2017-12-25.
//  Copyright © 2017 SiamakEshghi. All rights reserved.
//

import UIKit

extension AppDelegate{
    //Config backBtn View
    func backBtnCongfigView() {
        let backButtonImage = UIImage(named: "back_btn")
        UINavigationBar.appearance().backIndicatorImage = backButtonImage
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = backButtonImage
        
        UINavigationBar.appearance().tintColor = UIColor.darkGray
        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffsetMake(0, -5), for: .default )
    }
    
    //set Default value
    func setDefaults() {
        
        if let city = defaults.string(forKey: "city") {
            
            Public.CityName = city
        }
        if let country = defaults.string(forKey: "country") {
            
            Public.CountryName = country
        }
        
        if  let userData = defaults.data(forKey: "currentUser"),
            let currenUser = try? JSONDecoder().decode(User.self, from: userData){
            
            Public.currentUser = currenUser
        }
    }
    
}
