//
//  RentFormViewController.swift
//  Login-ATM
//
//  Created by Siamak Eshghi on 2017-12-25.
//  Copyright © 2017 SiamakEshghi. All rights reserved.
//

import UIKit
import SVProgressHUD
//import GoogleMobileAds

class RentFormViewController: UIViewController {
    
    
    
    
    //This cancel button will appear if we present the View like present from ARView not Pushing  by NavigationController
    var isPresent = false
    
    @IBOutlet weak var cancelBt: UIButton!
    @IBAction func cancellBtn(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var webView: UIWebView!
    //    var interstitial: GADInterstitial!
    
    var url : String = ""
    var titlename:String = ""
    public override func awakeFromNib() {
        super.awakeFromNib()
        print("RentFormViewController awake from nib")
        
    }
    override public func viewDidLoad() {
        super.viewDidLoad()
        SVProgressHUD.dismiss()
        self.title = titlename
        configuerCancelBtn()
        createAndLoadInterstitial()
        webView.loadRequest(URLRequest(url: URL(string: url)!))
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        if interstitial.isReady {
//            interstitial.present(fromSideMenuRootController: self)
//        } else {
//            print("Ad wasn't ready")
//        }
        NSLog("RentFormViewController will appear")
    }
    public override func viewDidAppear(_ animated: Bool) {
        
    }
    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //createAndLoadInterstitial()
        NSLog("RentFormViewController will disappear")
        isPresent = false
    }
    
    func configuerCancelBtn()  {
        
        if isPresent{
            cancelBt.isHidden = false
        }else{
            cancelBt.isHidden = true
        }
    }
    
    fileprivate func createAndLoadInterstitial() {
//        interstitial = GADInterstitial(adUnitID: NSLocalizedString(Constants.INTERSTITIAL_ADS_UNIT_ID, comment: ""))
//        let request = GADRequest()
//        interstitial.load(request)
    }
}
