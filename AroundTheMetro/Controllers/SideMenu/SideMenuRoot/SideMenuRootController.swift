//
//  RootViewController.swift
//  Login-ATM
//
//  Created by Siamak Eshghi on 2018-01-05.
//  Copyright © 2018 SiamakEshghi. All rights reserved.
//

import UIKit
import AKSideMenu
import FBSDKLoginKit

class SideMenuRootController: AKSideMenu,AKSideMenuDelegate {

   
    override func awakeFromNib() {

        self.menuPreferredStatusBarStyle = UIStatusBarStyle.lightContent
        self.contentViewShadowColor = UIColor.black
        self.contentViewShadowOffset = CGSize(width: 0, height: 0)
        self.contentViewShadowOpacity = 0.6
        self.contentViewShadowRadius = 12
        self.contentViewShadowEnabled = true
        
        self.contentViewController = self.storyboard?.instantiateViewController(withIdentifier: "contentNavController")
        self.leftMenuViewController = self.storyboard?.instantiateViewController(withIdentifier: "leftMenuViewController")
        self.rightMenuViewController = self.storyboard?.instantiateViewController(withIdentifier: "shareViewController")
        
        self.backgroundImage = UIImage.init(named: "left-side-menu")
        sideMenuViewController?.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - <AKSideMenuDelegate>
    //    public override func presentRightMenuViewController() {
    //        let navigator = self.contentViewController as! UINavigationController
    //        navigator.pushViewController(appDelegate.shareVC, animated: true)
    //    }
    public func sideMenu(_ sideMenu: AKSideMenu, willShowMenuViewController menuViewController: UIViewController) {
        print("willShowMenuViewController")
    }
    
    public func sideMenu(_ sideMenu: AKSideMenu, didShowMenuViewController menuViewController: UIViewController) {
        print("didShowMenuViewController")
    }
    
    public func sideMenu(_ sideMenu: AKSideMenu, willHideMenuViewController menuViewController: UIViewController) {
        print("willHideMenuViewController")
    }
    
    public func sideMenu(_ sideMenu: AKSideMenu, didHideMenuViewController menuViewController: UIViewController) {
        print("didHideMenuViewController")
    }
}
