//
//  ProfileViewController.swift
//  Login-ATM
//
//  Created by Siamak Eshghi on 2018-01-05.
//  Copyright © 2018 SiamakEshghi. All rights reserved.
//

import UIKit
import Kingfisher
import FBSDKLoginKit
import GoogleSignIn

class ProfileViewController: AdViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var btnCancelOutlet: UIBarButtonItem!
    @IBOutlet weak var btnChangeLanguage: UIButton!
    
    var strSelectedLanguage = String()
    
    var arrLanguages = ["English", "French", "Spanish", "Chinese"]
    
    @IBOutlet weak var pickerViewLanguage: UIPickerView!
    @IBOutlet weak var viewContainedPicker: UIView!
    
    @IBOutlet weak var btnLogout: UIButton!
    @IBOutlet weak var btnDoneBarButton: UIBarButtonItem!
    @IBOutlet weak var navigationItemForTitle: UINavigationItem!
    
    @IBOutlet weak var profilePlace: UILabel!
    @IBOutlet weak var profileNameTextView: UILabel!
    @IBOutlet weak var profileImgView: UIImageView!

    @IBAction func logOutTapped(_ sender: UIButton) {
        FBSDKLoginManager().logOut()
        GIDSignIn.sharedInstance().signOut()
        
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "currentUser")
        defaults.removeObject(forKey: "city")
        defaults.removeObject(forKey: "country")

        Public.currentUser = nil

        self.sideMenuViewController?.presentLeftMenuViewController()

        if let homeVc = storyboard?.instantiateViewController(withIdentifier: "homeViewController") as? HomeViewController {
            self.sideMenuViewController?.setContentViewController(UINavigationController.init(rootViewController: homeVc), animated: true)
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        let defaults = UserDefaults.standard
        navigationItemForTitle.title = "Profile".localizedToLanguage(languageSymbol: defaults.fetchSelectedLanguage())
        btnChangeLanguage.setTitle("Change Language".localizedToLanguage(languageSymbol: defaults.fetchSelectedLanguage()), for: .normal)
        btnDoneBarButton.title = "Done".localizedToLanguage(languageSymbol: defaults.fetchSelectedLanguage())
        btnCancelOutlet.title = "Cancel".localizedToLanguage(languageSymbol: defaults.fetchSelectedLanguage())
        
        btnLogout.setTitle("Log out".localizedToLanguage(languageSymbol: defaults.fetchSelectedLanguage()), for: .normal)
        
        viewContainedPicker.isHidden = true

        setupView()
    }

    @IBAction func btnCancelAction(_ sender: UIBarButtonItem) {
        
        viewContainedPicker.isHidden = true
    }
    
    
    @IBAction func btnDoneBarAction(_ sender: UIBarButtonItem) {
        
        var strToBeSaved: String
        switch strSelectedLanguage {
        case "French": strToBeSaved = "fr"
        case "Spanish": strToBeSaved = "es"
        case "Chinese": strToBeSaved = "zh-Hant"
        default: strToBeSaved = "en"
        }
        
        UserDefaults.standard.setSelectedLanguage(languageSelected: strToBeSaved)
        
        viewDidLoad()
        
        pickerViewLanguage.reloadAllComponents()
    }
    
    func setupView() {
        self.profileImgView.layer.cornerRadius = 20
        self.profileImgView.layer.masksToBounds = true

        if Public.currentUser?.profileImgUrl != nil && Public.currentUser?.profileImgUrl != "" {
            
            self.profileImgView.kf.setImage(with: URL(string: (Public.currentUser?.profileImgUrl)!)!)
        }
        else {
            
            self.profileImgView.image = #imageLiteral(resourceName: "avatar-1")
        }

        profilePlace.text = Public.CityName
        profileNameTextView.text = Public.currentUser?.profileName
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrLanguages.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        strSelectedLanguage = arrLanguages[row]
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let defaults = UserDefaults.standard
        return arrLanguages[row].localizedToLanguage(languageSymbol: defaults.fetchSelectedLanguage())
    }
    
    @IBAction func btnChangeLanguageAction(_ sender: UIButton) {
        
        self.viewContainedPicker.isHidden = false
        
        pickerViewLanguage.delegate = self
        
        pickerViewLanguage.dataSource = self
    }
}
