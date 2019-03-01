//
//  ShareVC-Extenstion.swift
//  Login-ATM
//
//  Created by Siamak Eshghi on 2018-01-16.
//  Copyright © 2018 SiamakEshghi. All rights reserved.
//

import UIKit
import SafariServices
import MessageUI
import FBSDKShareKit
import TwitterKit
import SVProgressHUD

extension ShareViewController{
    
 //**************************************
    //MARK: - Share in GOOGLE+
    func shareInGooglePlus(content: String,isURL: Bool){
        var urlComponent: URLComponents = URLComponents(string: "https://plus.google.com/share")!
        if (isURL){
            urlComponent.queryItems = [URLQueryItem(name:"url", value: content)]
        }else{
            urlComponent.queryItems = [URLQueryItem(name:"text", value:content)]
        }
        
        let url = urlComponent.url
        let controller = SFSafariViewController(url:url!)
        controller.delegate = self
        self.present(controller, animated: true, completion: nil)
    }
    
    //SFSafariViewControllerDelegate function
    //dissmiss safari
    public func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        
        print("safariViewControllerDidFinish")
    }
    
    //**************************************
    
    //MARK: - Share in Twitter
    func shareInTwT(content: String,isURL: Bool) {
        
        let composer = TWTRComposer()
        
        if isURL {
            
            composer.setURL(URL(string: content))
        }
        else {
            
            composer.setText(content)
        }
        
        // Called from a UIViewController
        composer.show(from: self) { result in
            
            if (result == TWTRComposerResult.done) {
                
                print("Tweet composition success")
            }
            else if (result == TWTRComposerResult.cancelled) {
                
                print("Tweet composition cancelled")
            }
        }
    }
    
  //**************************************
  
    //Mark: - Share in Facebook
    func shareInFacebook(content: String,isUrl: Bool)  {
        
        let contentObj: FBSDKShareLinkContent = FBSDKShareLinkContent()
        
        if isUrl{
            
            contentObj.contentURL = URL(string:content)!
        }
        else {
            
            contentObj.quote = content
        }
        
        let fShareDialog: FBSDKShareDialog = FBSDKShareDialog()
        
        fShareDialog.shareContent = contentObj
        
        fShareDialog.mode = .native
        
        fShareDialog.delegate = self
        
        fShareDialog.show()
    }
    
    
    //FBSDKSharingDelegate functions
    public func sharer(_ sharer: FBSDKSharing!, didCompleteWithResults results: [AnyHashable : Any]!) {
    
        print("didCompleteWithResults")
    }
    
    /**
     Sent to the delegate when the sharer encounters an error.
     - Parameter sharer: The FBSDKSharing that completed.
     - Parameter error: The error.
     **/
    public func sharer(_ sharer: FBSDKSharing!, didFailWithError error: Error!) {
        
        print(error)
        
        let alert = UIAlertController(title: "Facebook Post failed".localizedToLanguage(languageSymbol: UserDefaults.standard.fetchSelectedLanguage()), message: "You do have to Sign in Facebook to post.".localizedToLanguage(languageSymbol: UserDefaults.standard.fetchSelectedLanguage()), preferredStyle: .alert)
        
        let settingAction = UIAlertAction(title: "Setting".localizedToLanguage(languageSymbol: UserDefaults.standard.fetchSelectedLanguage()), style: .default) { (_) in
        
            guard let settingUrl = URL(string: /*"prefs:root=FACEBOOK"*/UIApplicationOpenSettingsURLString)
                else{
                    return
            }
            if UIApplication.shared.canOpenURL(settingUrl){
                UIApplication.shared.open(settingUrl, completionHandler: { (success) in
                    
                })
            }
        }
        
        alert.addAction(settingAction)
        
        alert.addAction(UIAlertAction(title: "Cancel".localizedToLanguage(languageSymbol:UserDefaults.standard.fetchSelectedLanguage()), style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    public func sharerDidCancel(_ sharer: FBSDKSharing!) {
       print("sharerDidCancel")
    }
    
    
   
  //**************************************
    
    //MFMailComposeViewControllerDelegate function
    //dissmiss email page
    public func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
}
