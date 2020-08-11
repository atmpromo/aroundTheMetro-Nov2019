//
//  MetroViewController.swift
//  Login-ATM
//
//  Created by Siamak Eshghi on 2017-12-27.
//  Copyright © 2017 SiamakEshghi. All rights reserved.
//

import UIKit

class MetroViewController: AdViewController,UITableViewDelegate,UITableViewDataSource {
    
    var list : [NSDictionary] = []
    var mode : PlacesMode = .Restaurants
    @IBOutlet var tableView: UITableView!

    
    //Mark: Tableview DataSource and Delegate Functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MetroListCell") as! MetroListCell
        let metro = list[indexPath.row]
        cell.titleLabel.text = metro["metro_name"] as! String?
        cell.iconView.image = UIImage(named: "metro-green")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let metro = list[indexPath.row]
        var type : String = "restaurant"
        switch mode {
        case .Restaurants:
            type = NSLocalizedString("restaurants", comment: "restaurant")
            break
        case .Boutiques:
            type = NSLocalizedString("boutiques", comment: "boutique")
            break
        case .Attractions:
            type = NSLocalizedString("Attractions", comment: "attraction")
            break
        case .BeautyHealth:
            type = NSLocalizedString("BeautyHealths", comment:"beauty & health")
            break
        }
        
        var parameter : NSDictionary = [:]
        parameter = ["type":type]
        let metro_ID = metro["metro_ID"] as! String
        
        //Mark: - Get stores inside the mall
        NetworkAdapter.request(target: .getPlaces(parameters: parameter as! [String : String]), success: { (json) in
            let allPlaceViewController = self.storyboard?.instantiateViewController(withIdentifier: "placeListViewController") as! PlaceListViewController
            let list1 = json["places"] as! [NSDictionary]
            allPlaceViewController.list = list1.filter {$0["metro_ID"] as! String == metro_ID}
            allPlaceViewController.title = metro["metro_name"] as? String
            allPlaceViewController.mode = self.mode
            allPlaceViewController.baseURL = json["download_prefix_store"] as! String
            allPlaceViewController.coverphotoURL = json["download_prefix_store_coverphoto"] as! String
            Public.configureBackButton(vc: self)
            self.navigationController?.pushViewController(allPlaceViewController, animated: true)
        }, error: nil, failure: nil)
    }
    
}

//Mark: MetroListCell
class MetroListCell: UITableViewCell {
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    var cellData : NSDictionary = [:]
    func configureCell(){
        titleLabel.text = cellData["name"] as? String
    }    
}

