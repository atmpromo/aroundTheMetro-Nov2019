//
//  PlaceListViewController.swift
//  Login-ATM
//
//  Created by Siamak Eshghi on 2017-12-27.
//  Copyright © 2017 SiamakEshghi. All rights reserved.
//

import UIKit
import Kingfisher

class PlaceListViewController: AdViewController,UITableViewDelegate,UITableViewDataSource {

    var list : [NSDictionary] = []
    var baseURL: String!
    var coverphotoURL: String!
    var mode : PlacesMode = .Restaurants
    
    @IBOutlet weak var tableView: UITableView!
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
        print("Places List appear")
    }
    
    //Mark: - Tableview Datasource functions
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlaceListCell") as! PlaceListCell
        
        cell.cellData = list[indexPath.row]
        
        cell.baseimageurl = self.baseURL
        
        cell.mode = mode
        
        cell.configureCell()
        
        return cell
    }
    
    
     //Mark: - Tableview Delegate functions
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let place = list[indexPath.row]
        
        let placeDetailVC = self.storyboard?.instantiateViewController(withIdentifier: "placeDetailViewController") as! PlaceDetailViewController
        
        placeDetailVC.place = place
        
        placeDetailVC.baseimageurl = self.baseURL
        
        Public.configureBackButton(vc: self)
        
        self.navigationController?.pushViewController(placeDetailVC, animated: true)
    }
    
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 60
    }
 
}
class PlaceListCell: UITableViewCell {
    
    @IBOutlet weak var iconView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
  
    @IBOutlet weak var categoryLabel: UILabel!
  
    var mode : PlacesMode = .Restaurants
    
    var baseimageurl:String!
    
    var cellData : NSDictionary = [:]
    
    func configureCell() {
        
        let imagename = cellData["imagename"] as? String
        
        if ( imagename?.count == 0 ) {
            
            let type = cellData["type"] as! String
            
            if type == NSLocalizedString("Beauty & Health", comment:"Beauty & health") {
                
                iconView.image = UIImage(named: "salon-iconlist")
                
            }else if type == NSLocalizedString("Boutique", comment:"Boutique") {
                
                iconView.image = UIImage(named: "boutique-listicon")
                
            }else if type == NSLocalizedString("Attraction", comment:"Attraction") {
                
                iconView.image = UIImage(named: "attraction-iconlist")
                
            }else if type == NSLocalizedString("Restaurant", comment:"Restaurant") {
                
                iconView.image = UIImage(named: "resto-listicon")
            }
        } else {
            
            iconView.kf.setImage(with: URL(string: (self.baseimageurl + imagename!) as String!)!)
        }
        
        titleLabel.text = cellData["name"] as? String
        
        categoryLabel.text = (cellData["type"] as? String)?.localizedToLanguage(languageSymbol: UserDefaults.standard.fetchSelectedLanguage())
    }
}
