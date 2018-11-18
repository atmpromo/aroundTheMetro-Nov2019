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

class ProfileViewController: AdViewController {

    
    public override func awakeFromNib() {
        super.awakeFromNib()
    }
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
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let LoginVc = storyboard.instantiateViewController(withIdentifier: "loginViewController") as! LoginViewController
        self.present(LoginVc, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       setupView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupView()  {
        self.profileImgView.layer.cornerRadius = 20
        self.profileImgView.layer.masksToBounds = true
        //setImage
        if Public.currentUser?.profileImgUrl != nil && Public.currentUser?.profileImgUrl != ""{
            self.profileImgView.kf.setImage(with: URL(string: (Public.currentUser?.profileImgUrl)!)!)
        }else{
            self.profileImgView.image = #imageLiteral(resourceName: "avatar-1")
        }
        
        //setLable
        profilePlace.text = Public.CityName
        profileNameTextView.text = Public.currentUser?.profileName
        
    }

}
