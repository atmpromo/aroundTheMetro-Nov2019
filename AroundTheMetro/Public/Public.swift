//
//  Public.swift
//  Login-ATM
//
//  Created by Siamak Eshghi on 2017-12-25.
//  Copyright © 2017 SiamakEshghi. All rights reserved.
//
import UIKit
import MessageUI

struct Public {
    
    static func configureBackButton(vc: UIViewController) {
        let backItem = UIBarButtonItem()
        backItem.title = ""
        vc.navigationItem.backBarButtonItem = backItem // This will show in the next view controller being pushed
    }
    
    
    //MARK: - share something by email
    static func shareByEmail(destination:String,subject:String,body:String,mailComposeVC:
        MFMailComposeViewController,vc:UIViewController)  {
        
        mailComposeVC.setToRecipients([destination])
    
    mailComposeVC.setSubject(NSLocalizedString(subject, comment: "Subject"))
        mailComposeVC.setMessageBody(NSLocalizedString(body, comment: "Some Text"), isHTML: false)
        
        vc.present(mailComposeVC, animated: true, completion: nil)
    }
    
    static var currentUser: User?
    static var CityName: String = ""
    static var CountryName: String = ""
    
}
