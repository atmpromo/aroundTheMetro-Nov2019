//
//  PlacesViewController.swift
//  Login-ATM
//
//  Created by Siamak Eshghi on 2017-12-27.
//  Copyright © 2017 SiamakEshghi. All rights reserved.
//

import UIKit
import Tabman
import Pageboy
import SVProgressHUD

enum PlacesMode:UInt {
    case Restaurants = 0, Boutiques, BeautyHealth, Attractions
}

class PlacesViewController: TabmanViewController, PageboyViewControllerDataSource {
    
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return 2
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        
        switch(index) {
            
        case 0:
            return allPlaceViewController
        case 1:
            return metroPlaceViewController
        default:
            return allPlaceViewController
        }
    }
    
    var mode : PlacesMode = .Restaurants
    var allPlaceViewController = PlaceListViewController()
    var metroPlaceViewController = MetroViewController()
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
    
    struct GradientConfig {
        let topColor: UIColor
        let bottomColor: UIColor
        
        static var defaultGradient: GradientConfig {
            return GradientConfig(topColor: .black, bottomColor: .black)
        }
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers() 
        setupView()
    }

    func setupViewControllers()  {
        allPlaceViewController = self.storyboard?.instantiateViewController(withIdentifier: "placeListViewController") as! PlaceListViewController
        metroPlaceViewController = self.storyboard?.instantiateViewController(withIdentifier: "metroListViewController") as! MetroViewController
    }

    func setupView() {
        self.title = NSLocalizedString("Shopping Malls", comment:"Shopping Malls")
        
        let strSelectedLanguage = UserDefaults.standard.fetchSelectedLanguage()
        
        self.dataSource = self
        self.bar.location = .top
        self.bar.style = .buttonBar
        let appearance = self.bar.appearance ?? TabmanBar.Appearance.defaultAppearance
        appearance.indicator.bounces = false
        appearance.state.color = UIColor.white
        appearance.state.selectedColor = UIColor.white
        appearance.style.background = .solid(color: UIColor(red: 0.078125, green: 0.1796875, blue: 0.234375, alpha: 1.0))
        appearance.indicator.color = UIColor(red:0.25, green:0.765625, blue:1.0, alpha:1.0)
        appearance.indicator.lineWeight = .thick
        appearance.indicator.compresses = true
        appearance.layout.edgeInset = 0.0
        appearance.layout.interItemSpacing = 0.0
        self.bar.appearance = appearance
        self.bar.items = [Item(title: "ALL".localizedToLanguage(languageSymbol: strSelectedLanguage)),Item(title: "BY METRO".localizedToLanguage(languageSymbol: strSelectedLanguage))]
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.allPlaceViewController.mode = self.mode
        
        NSLog("PlacesViewController : viewWillAppear")
        
        let strSelectedLanguage = UserDefaults.standard.fetchSelectedLanguage()
        
        switch mode {
            
        case .Attractions:
            
            self.navigationItem.title = "Attractions".localizedToLanguage(languageSymbol: strSelectedLanguage)
            
            //self.titleLabel.text = NSLocalizedString("Attractions", comment:"Attractions")
            getAttractions()
            
            break
        case .BeautyHealth:
            
            self.navigationItem.title = "Beauty & Health".localizedToLanguage(languageSymbol: strSelectedLanguage)
          
            //self.titleLabel.text = NSLocalizedString("Beauty & Health", comment:"Beauty & Health")
            
            getBeautyAndHealth()
            
            break
        case .Boutiques:
            
            self.navigationItem.title = "Boutiques".localizedToLanguage(languageSymbol: strSelectedLanguage)
            //self.titleLabel.text = NSLocalizedString("Boutiques", comment:"Boutiques")
            
            getBoutiques()
            
            break
        case .Restaurants:
            
            self.navigationItem.title = "Restaurants".localizedToLanguage(languageSymbol: strSelectedLanguage)
            //self.titleLabel.text = NSLocalizedString("Restaurants", comment:"Restaurants")
            
            getRestaurants()
            
            break
        }
    }
    

    func getRestaurants() {
        
        fetchAndSetData(storeApiParameters: ["type":NSLocalizedString("restaurants", comment:"Restaurant")], metroListForStoreApParameters: ["type":NSLocalizedString("restaurants", comment:"Restaurant")])
    }

    func getBoutiques() {
        
        fetchAndSetData(storeApiParameters:["type":NSLocalizedString("boutiques", comment:"Boutique")], metroListForStoreApParameters: ["type":NSLocalizedString("boutiques", comment:"Boutique")])
    }
    

    func getBeautyAndHealth(){
        fetchAndSetData(storeApiParameters: ["type":NSLocalizedString("BeautyHealths", comment:"Beauty & Health")], metroListForStoreApParameters: ["type":NSLocalizedString("BeautyHealths", comment:"Beauty & Health")])
    }
    
    func getAttractions(){
        fetchAndSetData(storeApiParameters: ["type":NSLocalizedString("Attractions", comment:"Attraction")], metroListForStoreApParameters: ["type":NSLocalizedString("Attractions", comment:"Attraction")])
    }
    
    //Mark: - Set Data for All
    func setData(json: NSDictionary) {
            let stores = json["places"] as! [NSDictionary]
            self.allPlaceViewController.list = stores
            self.allPlaceViewController.mode = self.mode
            self.allPlaceViewController.baseURL = json["download_prefix_store"] as! String
            self.allPlaceViewController.coverphotoURL = json["download_prefix_store_coverphoto"] as! String
            self.allPlaceViewController.tableView.reloadData()
            SVProgressHUD.dismiss()
    }
    
    //Mark: - Set Metro list
    func setMetroList(json: NSDictionary) {
//            print(json)
            let metros = json["metros"] as! [NSDictionary]
            self.metroPlaceViewController.list = metros
            self.metroPlaceViewController.mode = self.mode
            SVProgressHUD.dismiss()
    }
    
    
    //Mark: - Fetch List of stores and metro stores and set data in allPlaceViewController and metroPlaceViewController
    func fetchAndSetData(storeApiParameters: [String:String], metroListForStoreApParameters: [String:String] ) {
        NetworkAdapter.request(target: .getPlaces(parameters:  storeApiParameters), success: { (json) in
            self.setData(json: json)
        }, error: nil, failure: nil)
        
        NetworkAdapter.request(target: .getMetroListForStoreAPI(parameters: metroListForStoreApParameters), success: { (json) in
            self.setMetroList(json: json)
        }, error: nil, failure: nil)
    }
}

