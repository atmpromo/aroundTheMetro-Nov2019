//
//  ARListViewController.swift
//  Login-ATM
//
//  Created by Siamak Eshghi on 2017-12-29.
//  Copyright © 2017 SiamakEshghi. All rights reserved.
//

import UIKit
import SVProgressHUD
import CoreLocation
import HDAugmentedReality

class ARListViewController: AdViewController,UITableViewDelegate,UITableViewDataSource {

    var promotions : [NSDictionary] = []
//    var baseImageUrl: String = ""
    let types = ["All", "Restaurant", "Beauty & Health", "Attraction", "Boutique"]
    
    let typeimgs = ["jobs", "resto-listicon", "salon-iconlist", "attraction-iconlist", "boutique-listicon"]
    var selectedPlaces:[ARPlace]?
    var arViewController: ARViewController!
     var sliderStep:Float = 10;
    var slider: UISlider?
    
    
    @IBOutlet weak var tableView: UITableView!
 
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        self.title = "AR View".localizedToLanguage(languageSymbol: defaults.fetchSelectedLanguage())
        getPromotions()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //Get stores info for displaying in AR View
    func getPromotions()  {
        NetworkAdapter.request(target: .getPromotionsAPI(parameters: [:]), success: { (json) in
                    self.promotions = json["places"] as! [NSDictionary]
//                    self.baseImageUrl = json["download_prefix_promotion"] as! String
                    SVProgressHUD.dismiss()
            //print(self.promotions)
        }, error: nil, failure: nil)
    }
    
}

//Tableview Functions
extension ARListViewController{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return types.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ARCategoryListCell") as! ARCategoryListCell
        
        let strTxt = setLanguageLocalization(index: indexPath.row)
            
            cell.titleLabel.text = strTxt
//        cell.titleLabel.text = self.types[indexPath.row]
        cell.iconView.image = UIImage(named: typeimgs[indexPath.row])
        return cell
    }
    
    
    func setLanguageLocalization(index: Int) -> String {
        
        let strSelectedLanguage = defaults.fetchSelectedLanguage()
    
        let strKey = types[index]
        
        let strLocalized = strKey.localizedToLanguage(languageSymbol: strSelectedLanguage)
        
        return strLocalized
        
        }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 66
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedPlaces = [ARPlace]()
        
        let selectedType:String = NSLocalizedString(self.types[indexPath.row], comment:self.types[indexPath.row])
        
        if indexPath.row >= 1 {
            selectedPlaces = extractARPlace(promotions: promotions, selectedType: selectedType)
            
        }
        else {
            
            selectedPlaces = extractARPlace(promotions: promotions, selectedType: nil)
            
        }
        self.displayAR()
    }
    
    //Mark: - Extract ARPlace classes from promotions
    func extractARPlace(promotions: [NSDictionary], selectedType: String?) -> [ARPlace] {
        var places = [ARPlace]()
        
        for promotion in promotions {
            let type = promotion["storetype"] as! String
            let name = promotion["storename"] as! String
            let phoNumber = promotion["contact"] as? String
            let desc = promotion["description"] as? String
            let googleLink = promotion["link"] as? String
            let imageName = promotion["imagename"] as? String
            
            let latitude = promotion["latitude"] as! String
            let longitude = promotion["longitude"] as! String
            let location = CLLocation(latitude: Double(latitude)!, longitude: Double(longitude)!)
            
            let place = ARPlace(location: location, type: type, name: name)
            place.phoneNumber = phoNumber
            place.desc = desc
            place.googleLink = googleLink
            place.imagename = imageName
            
            if selectedType != nil {
                if place.type == selectedType{
                    places.append(place)
                }
            }else{
                places.append(place)
            }
        }
        
        return places
    }
}


//ARCategoryListCell
class ARCategoryListCell: UITableViewCell {
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    var cellData : NSDictionary = [:]
    func configureCell(){
    }
}
