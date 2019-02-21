//
//  PlaceDetailViewController.swift
//  Login-ATM
//
//  Created by Siamak Eshghi on 2017-12-27.
//  Copyright © 2017 SiamakEshghi. All rights reserved.
//

import UIKit
import Kingfisher
import FirebaseAnalytics

class PlaceDetailViewController: AdViewController {

    var place : NSDictionary = [:]
    var baseimageurl : String!
    var isFromSearch : Bool = false
    var websiteAddress: String?
    var phoneNumber: String?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var mallLabel: UILabel!
    @IBOutlet weak var metroLabel: UILabel!
  
    @IBOutlet weak var openhoursTxtView: UITextView!
    
    @IBOutlet weak var callusBtn: UIButton!
    
 
    @IBOutlet weak var websiteBtn: UIButton!
    
    
    let defaults = UserDefaults.standard
    
    @IBAction func callUsBtnTapped(_ sender: UIButton) {
        let p = (place["name"] as? String)!
        Analytics.logEvent("call_placed", parameters: [
            "place": p as NSObject,
            "phoneNumber": phoneNumber ?? "not a number" as NSObject
            ])
        guard let number = URL(string: "telprompt://" + phoneNumber!) else {return}
        UIApplication.shared.open(number, options: [:], completionHandler: nil)
    }
    
    
    @IBAction func websiteBtnTapped(_ sender: UIButton) {
        
        let p = (place["name"] as? String)!
        
        Analytics.logEvent("website_clicked", parameters: [
            "place": p as NSObject,
            "url": websiteAddress ?? "no url" as NSObject
            ])
        
        let rentFormVC = self.storyboard?.instantiateViewController(withIdentifier: "rentFormViewController") as! RentFormViewController
        
        rentFormVC.titlename = (place["name"] as? String)!
        
        rentFormVC.url = websiteAddress! as String
        
        Public.configureBackButton(vc: self)
        
        self.navigationController?.pushViewController(rentFormVC, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        //Sending info to Firebase (place name of page viewed)
        let p = (place["name"] as? String)!
        
        Analytics.logEvent("place_page_view", parameters: [
            "place": p as NSObject,
            ])
        
        let strSelectedLanguage = defaults.fetchSelectedLanguage()
        
        callusBtn.setTitle("Call Us".localizedToLanguage(languageSymbol: strSelectedLanguage), for: .normal)
        
        websiteBtn.setTitle("Website".localizedToLanguage(languageSymbol: strSelectedLanguage), for: .normal)
        
//        print(place)
        setupView()
    }


    
    func setupView() {

        self.title = place["name"] as? String
        
        let imagename = place["imagename"] as? String
        
        if ( imagename == nil || imagename?.count == 0 ) {
            let type = place["type"] as! String
            if type == NSLocalizedString("Beauty & Health", comment:"Beauty & health") {
                self.imageView.image = UIImage(named: "salon-iconlist")
            }else if type == NSLocalizedString("Boutique", comment:"Boutique") {
                self.imageView.image = UIImage(named: "boutique-listicon")
            }else if type == NSLocalizedString("Attraction", comment:"Attraction") {
                self.imageView.image = UIImage(named: "attraction-iconlist")
            }else if type == NSLocalizedString("Restaurant", comment:"Restaurant") {
                self.imageView.image = UIImage(named: "resto-listicon")
            }
        }
        else {
            
            self.imageView.kf.setImage(with: URL(string: (self.baseimageurl! + imagename!) as String)!)
        }
        
        titleLabel.text = place["name"] as? String
        
        if let type = place["type"] as? String {
        
            typeLabel.text = "Type : \(type)".localizedToLanguage(languageSymbol: defaults.fetchSelectedLanguage()) }else {
            typeLabel.text = ""
        }
        
        if let metroName = place["metroname"] as? String {
            
            let strMetro = "Metro".localizedToLanguage(languageSymbol: defaults.fetchSelectedLanguage())
            
            metroLabel.text = "\(strMetro) : \(metroName)"
        }
        else {

            metroLabel.text = ""
        }
        
        if let mallname = place["mallname"] as? String{
            
            let strMall = "Mall".localizedToLanguage(languageSymbol: defaults.fetchSelectedLanguage())
            
            mallLabel.text = "\(strMall) : \(mallname)" }else{ mallLabel.text = ""}
        
        websiteAddress = place["website"] as? String
        
        if ( websiteAddress == nil || websiteAddress?.count == 0 ) {
            
            websiteBtn.isHidden = true
        }
        
        
        //In new API Maybe it is phone instead of contact
        phoneNumber = place["contact"] as? String

        if (phoneNumber == nil || phoneNumber?.count == 0) {
            
            callusBtn.isHidden = true
        }
    }
}
