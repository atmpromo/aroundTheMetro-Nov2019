//
//  HomeExtention.swift
//  Login-ATM
//
//  Created by Siamak Eshghi on 2017-12-27.
//  Copyright © 2017 SiamakEshghi. All rights reserved.
//

import UIKit
import SVProgressHUD

extension HomeViewController{
    
    //BannerImagesProtocol Functions
    func didClickBanner(index: Int) {
        SVProgressHUD.show()
        let bannerImage = bannerimages[index]
        
        let link = (bannerImage["link"] as? String)!
        if (link.count > 0 ) {
            let rentFormVC = self.storyboard?.instantiateViewController(withIdentifier: "rentFormViewController") as! RentFormViewController
            rentFormVC.titlename = (bannerImage["title"] as? String)!
            rentFormVC.url = (bannerImage["link"] as? String)!
            Public.configureBackButton(vc:self)
            self.navigationController?.pushViewController(rentFormVC, animated: true)
        } else {
            SVProgressHUD.dismiss()
            let alert = UIAlertController(title: NSLocalizedString("Cannot open the website", comment:"null link title"), message: NSLocalizedString("URL not specified", comment:"null link message"), preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment:"ok"), style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    //MenuProtocol Functions
    
    func didARListClicked() {
        Public.configureBackButton(vc:self)
        print("didARListClicked")
        SVProgressHUD.show()
        let ARVC = self.storyboard?.instantiateViewController(withIdentifier: "arListViewController") as! ARListViewController
        
        Public.configureBackButton(vc: self)
        self.navigationController?.pushViewController(ARVC, animated: true)
        //    showInterstitialAds(name: "ARListViewController")
        
    }
    func didMetroPlanClicked() {
        Public.configureBackButton(vc:self)
        print("didMetroPlanClicked")
        SVProgressHUD.show()
        let MetroPlanVC = self.storyboard?.instantiateViewController(withIdentifier: "MetroPlanViewController") as! MetroPlanViewController
        MetroPlanVC.title = "Metro Plan"
        Public.configureBackButton(vc:self)
        self.navigationController?.pushViewController(MetroPlanVC, animated: true)
        
        //     showInterstitialAds(name: "MetroPlanViewController")
        
    }
    //     func didShoppingMallsClicked(){
    //        Public.configureBackButton(vc:self)
    //        print("didShoppingMallsClicked")
    //        SVProgressHUD.show()
    //        let ShoppingVC = self.storyboard?.instantiateViewController(withIdentifier: "ShoppingViewController") as! ShoppingViewController
    //
    //        Public.configureBackButton(vc:self)
    //        self.navigationController?.pushViewController(ShoppingVC, animated: true)
    //
    //        //      showInterstitialAds(name: "ShoppingViewController")
    //
    //    }
    func didBoutiqueClicked(){
        didStoreClicked(PlacesMode.Boutiques)
    }
    
    func didRestaurantsClicked(){
        print("didRestaurantsClicked")
        didStoreClicked(PlacesMode.Restaurants)
    }
    //    @objc public func didBoutiquesClicked(){
    //        //        didStoreClicked(PlacesMode.Boutiques)
    //    }
    func didBeautyHealthClicked(){
        print("didBeautyHealthClicked")
        didStoreClicked(PlacesMode.BeautyHealth)
    }
    func didAttractionsClicked(){
        print("didAttractionsClicked")
        didStoreClicked(PlacesMode.Attractions)
    }
    func didStoreClicked(_ mode: PlacesMode)  {
        Public.configureBackButton(vc: self)
        //        showInterstitialAds(name: "PlacesViewController")
        SVProgressHUD.show()
        let StoresListVC = self.storyboard?.instantiateViewController(withIdentifier: "placesViewController") as! PlacesViewController
        StoresListVC.mode = mode
        self.navigationController?.pushViewController(StoresListVC, animated: true)
    }
}







