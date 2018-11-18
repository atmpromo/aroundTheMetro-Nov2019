//
//  ARSelecteStores.swift
//  Login-ATM
//
//  Created by Siamak Eshghi on 2018-01-03.
//  Copyright © 2018 SiamakEshghi. All rights reserved.
//

import UIKit
import CoreLocation
import HDAugmentedReality
import PopupDialog
import Kingfisher


// AnnotationViewDelegate didTouch Function
extension ARListViewController: AnnotationViewDelegate{
    
   
    
    func didTouch(annotationView: AnnotationView) {
        
        if let annotation = annotationView.annotation as? ARPlace{
            let title = annotation.type
            let message = annotation.placeName
            //let image: UIImage?
            var popup: PopupDialog?
            var callButton: DefaultButton?
            var directButton: DefaultButton?
            
            //**If there is image show it in popup
            //            if let imageName = annotation.imagename{
            //                 let imageUrl = URL(string: (self.baseImageUrl + imageName) as String!)!
            //                 let data = try? Data(contentsOf: imageUrl)
            //                 image = UIImage(data: data!)
            //                popup = PopupDialog(title: title, message: message, image: image)
            //            }else{
            popup = PopupDialog(title: title, message: message)
            //            }
            
            
            
            //Configure popup View
            popup?.buttonAlignment = .horizontal
            popup?.transitionStyle = .fadeIn
            
            stupPopupDialogeDarkTheme()
            
            
            //Buttons of popup
            var buttons = [PopupDialogButton]()
            
            let cancelButton = CancelButton(title: "CANCEL") {
                print("You canceled the car dialog.")
            }
            buttons.append(cancelButton)
            
            //if there is google address add direction button to popup
            if var googleAddress = annotation.googleLink{
                
                if googleAddress != ""{
                    
                    //remove \" from url
                    googleAddress = googleAddress.replacingOccurrences(of: "\"",with: "")
                    
                    directButton =  DefaultButton(title: "WEBSITE", dismissOnTap: true) {
                        print(googleAddress)
                        let rentFormVC = self.storyboard?.instantiateViewController(withIdentifier: "rentFormViewController") as! RentFormViewController
                        rentFormVC.titlename = annotation.placeName
                        rentFormVC.url = googleAddress
                        rentFormVC.isPresent = true
                        self.arViewController.present(rentFormVC, animated: true, completion: nil)
                     
                    }
                    buttons.append(directButton!)
                }
            }
            
            
            //if there is phoneNumber add call button to popup
            if var phonNumber = annotation.phoneNumber{
               
                if phonNumber != ""{
                    callButton =  DefaultButton(title: "CALL", dismissOnTap: true) {
                        phonNumber  = phonNumber.replacingOccurrences(of: " ", with: "", options: .literal, range: nil)
                        phonNumber  = phonNumber.replacingOccurrences(of: "(", with: "", options: .literal, range: nil)
                        phonNumber  = phonNumber.replacingOccurrences(of: ")", with: "", options: .literal, range: nil)
                        
                        guard let number = URL(string: "telprompt://" + phonNumber) else {return}
                        UIApplication.shared.open(number, options: [:], completionHandler: nil)
                    }
                    buttons.append(callButton!)
                }
            }
            
            
            
            popup?.addButtons(buttons)
            
            arViewController.present(popup!, animated: true, completion: nil)
        }
        
    }
    
    func stupPopupDialogeDarkTheme()  {
        // Customize dialog appearance
        let pv = PopupDialogDefaultView.appearance()
        pv.titleFont    = UIFont(name: "HelveticaNeue-Light", size: 16)!
        pv.titleColor   = UIColor.white
        pv.messageFont  = UIFont(name: "HelveticaNeue", size: 14)!
        pv.messageColor = UIColor(white: 0.8, alpha: 1)
        
        // Customize the container view appearance
        let pcv = PopupDialogContainerView.appearance()
        pcv.backgroundColor = UIColor(red:0.23, green:0.23, blue:0.27, alpha:1.00)
        pcv.cornerRadius    = 2
        pcv.shadowEnabled   = true
        pcv.shadowColor     = UIColor.black
        
        // Customize overlay appearance
        let ov = PopupDialogOverlayView.appearance()
        ov.blurEnabled = true
        ov.blurRadius  = 30
        ov.liveBlur    = true
        ov.opacity     = 0.7
        ov.color       = UIColor.black
        
        // Customize default button appearance
        let db = DefaultButton.appearance()
        db.titleFont      = UIFont(name: "HelveticaNeue-Medium", size: 14)!
        db.titleColor     = UIColor.white
        db.buttonColor    = UIColor(red:0.25, green:0.25, blue:0.29, alpha:1.00)
        db.separatorColor = UIColor(red:0.20, green:0.20, blue:0.25, alpha:1.00)
        
        // Customize cancel button appearance
        let cb = CancelButton.appearance()
        cb.titleFont      = UIFont(name: "HelveticaNeue-Medium", size: 14)!
        cb.titleColor     = UIColor(white: 0.6, alpha: 1)
        cb.buttonColor    = UIColor(red:0.25, green:0.25, blue:0.29, alpha:1.00)
        cb.separatorColor = UIColor(red:0.20, green:0.20, blue:0.25, alpha:1.00)
    }
    
}

