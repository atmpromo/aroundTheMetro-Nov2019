//
//  ShareViewController.swift
//  Montreal
//
//  Created by Colin Taylor on 3/8/17.
//  Copyright © 2017 William Andersson. All rights reserved.
//

import UIKit
import MessageUI
import SafariServices
import FBSDKShareKit

public class ShareViewController: UIViewController,MFMailComposeViewControllerDelegate,SFSafariViewControllerDelegate,FBSDKSharingDelegate{
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func emailAction(_ sender: Any) {
        
        if MFMailComposeViewController.canSendMail(){
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            Public.shareByEmail(destination: "", subject: "ATM", body: Constants.ATM_WEB_ADDRESS, mailComposeVC: mail, vc: self)
            }
    }
    
    @IBAction func gplusAction(_ sender: Any) {
     
        let ContentVC = self.storyboard?.instantiateViewController(withIdentifier: "contentNavController")
        self.sideMenuViewController!.setContentViewController(ContentVC!, animated: true)
        self.sideMenuViewController?.hideMenuViewController()
        
        shareInGooglePlus(content: Constants.ATM_WEB_ADDRESS, isURL: true)
    }
    
    @IBAction func twitterAction(_ sender: Any) {
        let ContentVC = self.storyboard?.instantiateViewController(withIdentifier: "contentNavController")
        self.sideMenuViewController!.setContentViewController(ContentVC!, animated: true)
        self.sideMenuViewController?.hideMenuViewController()
        
        shareInTwT(content: Constants.ATM_WEB_ADDRESS, isURL: true)
        
    }
    
    @IBAction func facebookAction(_ sender: Any) {
        let ContentVC = self.storyboard?.instantiateViewController(withIdentifier: "contentNavController")
        self.sideMenuViewController!.setContentViewController(ContentVC!, animated: true)
        self.sideMenuViewController?.hideMenuViewController()
        
        shareInFacebook(content: Constants.ATM_WEB_ADDRESS, isUrl: true)
    }
    
 
    
   
}
