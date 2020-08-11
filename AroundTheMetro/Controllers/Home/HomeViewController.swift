//
//  FirstViewController.swift
//  AKSideMenuSimple
//
//  Created by Diogo Autilio on 6/6/16.
//  Copyright © 2016 AnyKey Entertainment. All rights reserved.
//

import UIKit
import Moya
import Kingfisher


//import GoogleMobileAds


var bannerimages : [NSDictionary] = []

public class HomeViewController: AdViewController, UIGestureRecognizerDelegate, MenusProtocol, BannerImagesProtocol {
    
    
    @IBOutlet weak var tableView: UITableView! {
        
        didSet {
        
            tableView.delegate = self
            
            tableView.dataSource = self
            
            tableView.separatorStyle = .none
        }
    }
    
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        getBannerImages()
        
        title = Public.CityName
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func getBannerImages() {
        
        NetworkAdapter.request(target: .getBannerImagesAPI(parameters: [:]), success: { (jsonResponse) in
            
            bannerimages = jsonResponse["bannerimages"] as! [NSDictionary]
            
            DispatchQueue.main.async {
                
                self.tableView?.reloadData()
                
            }
        }, error: nil, failure: nil)
    }
}


// MARK: - UITableViewDataSource, UITableViewDelegate
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0, 1: return 1
        default: return 0
        }
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
            
        case 0:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: InfiniteTableViewCell.identifier) as! InfiniteTableViewCell
            
            cell.delegate = self
            
            cell.pageControl.numberOfPages = bannerimages.count
            
            cell.pageControl.currentPageIndicatorTintColor = UIColor.lightGray
            
            cell.collectionView.reloadData()
            
            return cell
            
        case 1:
           
            let cell = tableView.dequeueReusableCell(withIdentifier: Infinite2TableViewCell.identifier) as! Infinite2TableViewCell
           
            cell.delegate = self
            
            return cell
            
        default:
            
            return UITableViewCell()
        }
    }
    //Define width and heights of sections
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let width = UIScreen.main.bounds.size.width
        let height = width / (1242.0/708.0)
        switch indexPath.section {
        case 0:
            return height
            //return 240
        case 1: return 450
        default: return 0
        }
    }
}





