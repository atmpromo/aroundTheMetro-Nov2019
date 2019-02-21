//
//  StringExtensions.swift
//  AroundTheMetro
//
//  Created by gaurav vashisht on 19/02/19.
//  Copyright © 2019 AugmentedDiscovery. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    func localizedToLanguage(languageSymbol: String) -> String {
        
        let path = Bundle.main.path(forResource: languageSymbol, ofType: "lproj")
        
        let bundle = Bundle(path: path!)
        
        let strLocalized = NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
        
        return strLocalized
    }
    
}
