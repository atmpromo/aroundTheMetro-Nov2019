//
//  LoginExtension.swift
//  Login-ATM
//
//  Created by Siamak Eshghi on 2017-12-19.
//  Copyright © 2017 SiamakEshghi. All rights reserved.
//

import Foundation
import GoogleSignIn
import KVSpinnerView
import FBSDKCoreKit
import FBSDKLoginKit
import Moya
import ObjectMapper



extension LoginViewController: GIDSignInDelegate, GIDSignInUIDelegate{
    
    func checkUserStatus()  {
        KVSpinnerView.settings.backgroundRectColor = UIColor.darkGray
        //Check is user  signed in by Facebook
        let currentToken = FBSDKAccessToken.current()
        if (currentToken != nil && (Public.currentUser != nil)) {
            self.showProgress(title: "SIGNING IN FACEBOOK".localizedToLanguage(languageSymbol: defaults.fetchSelectedLanguage()), comment: "facebook", visibility: true)
            navigateToNextView()
        }else{
            GIDSignIn.sharedInstance().delegate = self
            GIDSignIn.sharedInstance().uiDelegate = self
            GIDSignIn.sharedInstance().shouldFetchBasicProfile = true
            
            //Check is user signedIn by Google
            if (GIDSignIn.sharedInstance().hasAuthInKeychain() && (Public.currentUser != nil)){
                self.showProgress(title: "SIGNING IN GOOGLE".localizedToLanguage(languageSymbol: defaults.fetchSelectedLanguage()), comment: "google", visibility: true)
            navigateToNextView()
            }
        }
    }
    
   
    
    //Mark: Facebook Sign In
    func facebookSignIn()  {
        
        let login : FBSDKLoginManager = FBSDKLoginManager()
        
        self.showProgress(title: "SIGNING IN FACEBOOK".localizedToLanguage(languageSymbol: defaults.fetchSelectedLanguage()), comment: "facebook", visibility: true)
        
        login.logIn(withReadPermissions: ["public_profile", "email"], from: self) { (result, error) in
            
            if ((error) != nil) {
                
                self.showProgress(title: "SIGNING IN FACEBOOK".localizedToLanguage(languageSymbol: self.defaults.fetchSelectedLanguage()), comment: "facebook", visibility: false)
                
            }
            else if (result?.isCancelled)! {
                self.showProgress(title: "SIGNING IN FACEBOOK".localizedToLanguage(languageSymbol: self.defaults.fetchSelectedLanguage()), comment: "facebook", visibility: false)
            } else {
                self.facebookGraphRequest()
            }
        }
    }
    
    
    //Mark: - Get facebook Graph
    func facebookGraphRequest()  {
        FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, middle_name, last_name, email, picture.width(512).height(512)"]).start(completionHandler: { (connection, result, error) -> Void in
            if (error == nil){
                let fbDetails = result as! NSDictionary
                let photourl = ((fbDetails["picture"] as! NSDictionary)["data"] as! NSDictionary)["url"] as! String
                
                self.registerUserInOurDatabase(name: fbDetails["name"] as! String, userid: fbDetails["id"] as! String, accessToken: FBSDKAccessToken.current().tokenString, photourl: photourl, isfb:true)
                
            } else {
                self.showProgress(title: "SIGNING IN FACEBOOK".localizedToLanguage(languageSymbol: self.defaults.fetchSelectedLanguage()), comment: "facebook", visibility: false)
            }
        })
    }
    
    
    
    //GIDSignInUIDelegate method
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        if error != nil {
            self.showProgress(title: "SIGNING IN GOOGLE".localizedToLanguage(languageSymbol: defaults.fetchSelectedLanguage()), comment: "google", visibility: false)
            return
        }
        
        var imageurl: String = ""
        
        if(signIn.currentUser.profile.hasImage){
            imageurl = signIn.currentUser.profile.imageURL(withDimension: 160).absoluteString
        }
        else {
            imageurl = "http://vortexapp.ca/montrealadmin/assets/img/avatar.png"
        }
        registerUserInOurDatabase(name: signIn.currentUser.profile.name, userid: signIn.currentUser.userID, accessToken: signIn.currentUser.authentication.accessToken, photourl: imageurl, isfb: false)
    }
    
    // Present a view that prompts the user to sign in with Google
    public func sign(_ signIn: GIDSignIn!,
                     present viewController: UIViewController!) {
        DispatchQueue.main.async {
            self.present(viewController, animated: true, completion: nil)
        }
    }
    
    // Dismiss the "Sign in with Google" view
    public func sign(_ signIn: GIDSignIn!,
                     dismiss viewController: UIViewController!) {
        DispatchQueue.main.async {
              self.dismiss(animated: true, completion: nil)
        }
    }
    
    
    //Mark: -Register user in our database
    func registerUserInOurDatabase(name:String!, userid:String!, accessToken:String!, photourl:String!, isfb:Bool!)  {
        NetworkAdapter.request(target: .authenticateUser(name: name, userid: userid, acessToken: accessToken, photourl: photourl, isfb: isfb), success: { (jsonResponse) in
            
            let currentUser = User()
            currentUser.profileName = name
            currentUser.profileUserId = userid
            currentUser.token = accessToken
            currentUser.profileImgUrl = photourl
            currentUser.isFacebook = isfb
            Public.currentUser = currentUser
            
            //Save Current User
            if let encoded = try? JSONEncoder().encode(currentUser){
                self.defaults.set(encoded, forKey: "currentUser")
            }
            
        }, error: {(err) in
            self.defaults.removeObject(forKey: "currentUser")
        }, failure: {(err) in
            self.defaults.removeObject(forKey: "currentUser")
        })
        
        navigateToNextView()
    }
    
    
    //Mark: - navigate to WorldWide View Controller
    func navigateToNextView() {
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: {
                self.didDismiss?()
            })
        }
    }
    
    func setLocation() {
        if let city = defaults.string(forKey: "city"){
            Public.CityName = city
        }
        if let country = defaults.string(forKey: "country"){
            Public.CountryName = country
        }
    }
    
    
    
    //Mark: - Manage Snipper and login buttons interaction
    func showProgress(title: String, comment: String, visibility: Bool)  {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Error".localizedToLanguage(languageSymbol: self.defaults.fetchSelectedLanguage()), message: "There is a problem in login!".localizedToLanguage(languageSymbol: self.defaults.fetchSelectedLanguage()), preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK".localizedToLanguage(languageSymbol: self.defaults.fetchSelectedLanguage()), style: .default, handler: nil))
            
            if (visibility == true) {
                KVSpinnerView.show(on: self.view, saying:title)
            }
            else {
            
                KVSpinnerView.dismiss()
                
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
}
