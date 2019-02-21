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
    
    var arrLanguages = ["English","French"
        ,"Spanish"
        ,"Chinese"]
    
    @IBOutlet weak var pickerViewLanguage: UIPickerView!
    @IBOutlet weak var viewContainedPicker: UIView!
    
    @IBOutlet weak var btnLogout: UIButton!
    @IBOutlet weak var btnDoneBarButton: UIBarButtonItem!
    @IBOutlet weak var navigationItemForTitle: UINavigationItem!
    
    
    public override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBOutlet weak var profilePlace: UILabel!
    @IBOutlet weak var profileNameTextView: UILabel!
    @IBOutlet weak var profileImgView: UIImageView!
    
    
    let defaults = UserDefaults.standard
    
    @IBAction func logOutTapped(_ sender: UIButton) {
        FBSDKLoginManager().logOut()
        GIDSignIn.sharedInstance().signOut()
        
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "currentUser")
        defaults.removeObject(forKey: "city")
        defaults.removeObject(forKey: "country")
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let LoginVc = storyboard.instantiateViewController(withIdentifier: "loginViewController") as! LoginViewController
        self.present(LoginVc, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        navigationItemForTitle.title = "Profile".localizedToLanguage(languageSymbol: defaults.fetchSelectedLanguage())
        
        let strTxt = "Log out".localizedToLanguage(languageSymbol: defaults.fetchSelectedLanguage())
        
        btnChangeLanguage.setTitle("Change Language".localizedToLanguage(languageSymbol: defaults.fetchSelectedLanguage()), for: .normal)
        
        btnDoneBarButton.title = "Done".localizedToLanguage(languageSymbol: defaults.fetchSelectedLanguage())
        
        btnCancelOutlet.title = "Cancel".localizedToLanguage(languageSymbol: defaults.fetchSelectedLanguage())
        
        btnLogout.setTitle(strTxt, for: .normal)
        
        viewContainedPicker.isHidden = true
//
//        let height = adMobBannerView.frame.height
//
//        viewContainedPicker.frame.origin.y = viewContainedPicker.frame.origin.y - height
//        
        setupView()
    }

    
    
    @IBAction func btnCanelAction(_ sender: UIBarButtonItem) {
        
        viewContainedPicker.isHidden = true
    }
    
    
    @IBAction func btnDoneBarAction(_ sender: UIBarButtonItem) {
        
        var strToBeSaved = ""
        
        switch strSelectedLanguage {
            
        case "French":
            
            strToBeSaved = "fr"
            
        case "Spanish":
            
            strToBeSaved = "es"
            
        case "Chinese":
            
            strToBeSaved = "zh-Hant"
            
        default:
            
            strToBeSaved = "en"
        }
        
        UserDefaults.standard.setSelectedLanguage(languageSelected: strToBeSaved)
        
        viewDidLoad()
        
        pickerViewLanguage.reloadAllComponents()
    }
    
    
    func setupView() {
        
        self.profileImgView.layer.cornerRadius = 20
        
        self.profileImgView.layer.masksToBounds = true
        //setImage
        if Public.currentUser?.profileImgUrl != nil && Public.currentUser?.profileImgUrl != "" {
            
            self.profileImgView.kf.setImage(with: URL(string: (Public.currentUser?.profileImgUrl)!)!)
        }
        else {
            
            self.profileImgView.image = #imageLiteral(resourceName: "avatar-1")
        }
        
        //setLable
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
        
        return arrLanguages[row].localizedToLanguage(languageSymbol: defaults.fetchSelectedLanguage())
    }
    
    @IBAction func btnChangeLanguageAction(_ sender: UIButton) {
        
        self.viewContainedPicker.isHidden = false
        
        pickerViewLanguage.delegate = self
        
        pickerViewLanguage.dataSource = self
    }
    
    
}
