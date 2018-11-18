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
        self.scrollView.minimumZoomScale = 2
        self.scrollView.maximumZoomScale = 20.0
        SVProgressHUD.dismiss()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setImage()  {
        //Add API to download Metro Map for each city from backend
        var map = UIImage()
        
        switch Public.CityName {
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
        default:
            return
        }
        self.imageView.image = map
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }

}
