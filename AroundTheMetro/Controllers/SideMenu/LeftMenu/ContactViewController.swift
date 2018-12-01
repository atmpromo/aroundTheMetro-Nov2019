//
//  ContactViewController.swift
//  Login-ATM
//
//  Created by Siamak Eshghi on 2018-01-07.
//  Copyright © 2018 SiamakEshghi. All rights reserved.
//

import UIKit
import MessageUI

class ContactViewController: AdViewController,MFMailComposeViewControllerDelegate {

    let facebookeAddress:String = "https://www.facebook.com/AroundtheMetro/"
    let twitterAddress:String = "https://twitter.com/"
    let linkedinAddress:String = "https://www.linkedin.com/company/aroundthemetro/"
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        print("ContactViewController awake from nib")
    }
    override public func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func emailAction(_ sender: Any) {
        if MFMailComposeViewController.canSendMail(){
            let MailCVC = MFMailComposeViewController()
            MailCVC.mailComposeDelegate = self
            Public.shareByEmail(destination: "info@aroundthemetro.com", subject: "General message from iOS app", body: "", mailComposeVC: MailCVC, vc: self)
        }
    }
   
    @IBAction func facebookAction(_ sender: Any) {
       openUrlWithUIApplication(urlString: facebookeAddress)
    }
    @IBAction func twitterAction(_ sender: Any) {
        openUrlWithUIApplication(urlString: twitterAddress)
    }
    @IBAction func linkedInAction(_ sender: Any) {
        openUrlWithUIApplication(urlString: linkedinAddress)
    }
    
    func openUrlWithUIApplication(urlString:String) {
        guard let url = URL(string: urlString) else {return}
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    //MFMailComposeViewControllerDelegate function
    //dissmiss email page
    public func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    

}
