//
//  UserDefaults.swift
//  AroundTheMetro
//
//  Created by gaurav vashisht on 19/02/19.
//  Copyright © 2019 AugmentedDiscovery. All rights reserved.
//

import Foundation
import UIKit

extension UserDefaults {
    
    func setSelectedLanguage(languageSelected: String) {
        
        self.set(languageSelected, forKey: "languageSelected")
        
        synchronize()
    }
    
    func fetchSelectedLanguage() -> String {
        
        return string(forKey: "languageSelected") ?? ""
    }
}
