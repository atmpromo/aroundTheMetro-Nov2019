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

    
  
    @IBOutlet weak var facebookLoginBtn: UIButton!
    
    @IBOutlet weak var googleLoginBtn: UIButton!
    
    let defaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
      //  removeUserAndCityAndCountryJustForTest()
        
            checkUserStatus();
    }

    
    @IBAction func facebookLoginTapped(_ sender: UIButton) {
        facebookSignIn()       
    }
    
    @IBAction func googleLoginTapped(_ sender: UIButton) {
        self.showProgress(title: "SIGNING IN GOOGLE", comment: "google", visibility: true)
        GIDSignIn.sharedInstance().signIn()
    }
    
    
    func removeUserAndCityAndCountryJustForTest() {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "currentUser")
        defaults.removeObject(forKey: "city")
        defaults.removeObject(forKey: "country")
    }
    
}

