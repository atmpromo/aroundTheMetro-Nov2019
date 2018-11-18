//
//  User.swift
//  Login-ATM
//
//  Created by Siamak Eshghi on 2017-12-22.
//  Copyright © 2017 SiamakEshghi. All rights reserved.
//

import Foundation
import ObjectMapper

class User: NSObject, Codable{
    
    var profileUserId: String?
    var profileName: String?
    var profileBalance: String?
    var profileImgUrl: String?
    var token: String?
    var isFacebook: Bool?
    
}
