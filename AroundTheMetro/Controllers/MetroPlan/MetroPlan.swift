//
//  MetroPlan.swift
//  Login-ATM
//
//  Created by Siamak Eshghi on 2017-12-26.
//  Copyright © 2017 SiamakEshghi. All rights reserved.
//

import UIKit
import SVProgressHUD

class MetroPlanViewController: AdViewController,UIScrollViewDelegate {
    
    var titlename:String = ""
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setImage()
        self.title = titlename
        scrollView.delegate = self
        self.scrollView.minimumZoomScale = 1
        self.scrollView.maximumZoomScale = 10.0
        SVProgressHUD.dismiss()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setImage()  {
        //Add API to download Metro Map for each city from backend
        var map = UIImage()
        
        // map = #imageLiteral(resourceName: "Atlanta_Map")
        // map = #imageLiteral(resourceName: "Atlanta_Map")
        
        
        switch Public.CityName {
            
        case "Vienna":
            map = #imageLiteral(resourceName: "Vienna_Map")
        case "Montreal":
            map = #imageLiteral(resourceName: "Montreal_Map")
        case "Paris":
            map = #imageLiteral(resourceName: "Paris_Map")
        case "New_York_City":
            map = #imageLiteral(resourceName: "New_York_City_Map")
        case "London":
            map = #imageLiteral(resourceName: "London_Map")
        case "Barcelona":
            map = #imageLiteral(resourceName: "Barcelona_Map")
        case "Toronto":
            map = #imageLiteral(resourceName: "Toronto_Map")
        case "Vancouver":
            map = #imageLiteral(resourceName: "Vancouver_Map")
        case "Dubai":
            map = #imageLiteral(resourceName: "Dubai_Map")
        case "Marseille":
            map = #imageLiteral(resourceName: "Marseille_Map")
        case "Lyon":
            map = #imageLiteral(resourceName: "Lyon_Map")
        case "Toulouse":
            map = #imageLiteral(resourceName: "Toulouse_Map")
        case "Delhi":
            map = #imageLiteral(resourceName: "Delhi_Map")
        case "Kolkata":
            map = #imageLiteral(resourceName: "Kolkata_Map")
        case "Mumbai":
            map = #imageLiteral(resourceName: "Mumbai_Map")
        case "Rome":
            map = #imageLiteral(resourceName: "Rome_Map")
        case "Milan":
            map = #imageLiteral(resourceName: "Milan_Map")
        case "Tokyo":
            map = #imageLiteral(resourceName: "Tokyo_Map")
        case "Osaka":
            map = #imageLiteral(resourceName: "Osaka_Map")
        case "Yokohama":
            map = #imageLiteral(resourceName: "Yokohama_Map")
        case "Nagoya":
            map = #imageLiteral(resourceName: "Nagoya_Map")
        case "Seoul":
            map = #imageLiteral(resourceName: "Seoul_Map")
        case "Busan":
            map = #imageLiteral(resourceName: "Busan_Map")
        case "Madrid":
            map = #imageLiteral(resourceName: "Madrid_Map")
        case "Bilbao":
            map = #imageLiteral(resourceName: "Bilbao_Map")
        case "Stockholm":
            map = #imageLiteral(resourceName: "Stockholm_Map")
        case "Lausanne":
            map = #imageLiteral(resourceName: "Lausanne_Map")
        case "Taipei":
            map = #imageLiteral(resourceName: "Taipei_Map")
        case "Istanbul":
            map = #imageLiteral(resourceName: "Istanbul_Map")
        case "Glasgow":
            map = #imageLiteral(resourceName: "Glasgow_Map")
        case "Miami":
            map = #imageLiteral(resourceName: "Miami_Map")
        case "Chicago":
            map = #imageLiteral(resourceName: "Chicago_Map")
        case "Atlanta":
            map = #imageLiteral(resourceName: "Atlanta_Map")
         
            
        default:
            return
        }
        self.imageView.image = map
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }

}
