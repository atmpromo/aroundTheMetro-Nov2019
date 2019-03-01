//
//  ViewController.swift
//  Login-ATM
//
//  Created by Siamak Eshghi on 2017-12-19.
//  Copyright © 2017 SiamakEshghi. All rights reserved.
//

import UIKit
import KVSpinnerView
import GoogleSignIn
import Crashlytics

class LoginViewController: UIViewController {
    
    @IBOutlet weak var imgViewLogo: UIImageView!
    
    @IBOutlet weak var facebookLoginBtn: UIButton!
    
    @IBOutlet weak var googleLoginBtn: UIButton!
    
    let defaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      //  removeUserAndCityAndCountryJustForTest()
        
//        defaults.setSelectedLanguage(languageSelected: "zh-Hant")
        
        setLanguageLocalization()
        
            checkUserStatus();
    }

    
    @IBAction func facebookLoginTapped(_ sender: UIButton) {
        
        facebookSignIn()       
    }
    
    
    @IBAction func googleLoginTapped(_ sender: UIButton) {
        
        self.showProgress(title: "SIGNING IN GOOGLE".localizedToLanguage(languageSymbol: defaults.fetchSelectedLanguage()), comment: "google", visibility: true)
        
        GIDSignIn.sharedInstance().signIn()
    }
    
    
    func removeUserAndCityAndCountryJustForTest() {
        
        let defaults = UserDefaults.standard
        
        defaults.removeObject(forKey: "currentUser")
        
        defaults.removeObject(forKey: "city")
        
        defaults.removeObject(forKey: "country")
    }
    

    func setLanguageLocalization() {
        
        let strSelectedLanguage = defaults.fetchSelectedLanguage()
        
        switch strSelectedLanguage {
            
        case "en":
            
            imgViewLogo.image = UIImage.init(named: "logo_fr_en")
            
        case "fr":
            
            imgViewLogo.image = UIImage.init(named: "logo_fr_fr")
        
        case "es":
            
            imgViewLogo.image = UIImage.init(named: "logo_fr_es")
            
        case "zh-Hant":
            
            imgViewLogo.image = UIImage.init(named: "logo_fr_zh")
        
        default:
            
            imgViewLogo.image = UIImage.init(named: "logo_fr_en")
        }
        
        if strSelectedLanguage != ""  {
            
        let strLocalizedFacebook = "LOG IN WITH FACEBOOK".localizedToLanguage(languageSymbol: strSelectedLanguage)
        
        let strLocalizedGOOGLE = "LOG IN WITH GOOGLE".localizedToLanguage(languageSymbol: strSelectedLanguage)
        
        googleLoginBtn.setTitle(strLocalizedGOOGLE, for: .normal )
        
        facebookLoginBtn.setTitle(strLocalizedFacebook, for: .normal )
        }
    }
}

