//
//  LeftMenuViewController.swift
//  Montreal
//
//  Created by Colin Taylor on 3/8/17.
//  Copyright © 2017 William Andersson. All rights reserved.
//

import UIKit
import Kingfisher

public class LeftMenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var tableView: UITableView?
    
    var balanceLabel: UILabel?
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override public func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        self.tableView?.reloadData()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NSLog("LeftMenuViewController will appear")
        
       
    }
    
    
    
    //Mark: - SetupView
    func setupView()  {
        let tableView: UITableView = UITableView.init(frame: CGRect(x: 0, y: (self.view.frame.size.height - (70 + 54 * 8)) / 2.0, width: self.view.frame.size.width, height:(70 + 54 * 8)), style: UITableViewStyle.plain)
        tableView.autoresizingMask = [UIViewAutoresizing.flexibleTopMargin, UIViewAutoresizing.flexibleBottomMargin, UIViewAutoresizing.flexibleWidth]
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isOpaque = false
        tableView.backgroundColor = UIColor.clear
        tableView.backgroundView = nil
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView.bounces = false
        
        self.tableView = tableView
        self.view.addSubview(self.tableView!)
        
    }

    
    // MARK: - <UITableViewDelegate>

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        switch indexPath.row {
        case 1:
           let HomeVc = storyboard?.instantiateViewController(withIdentifier: "homeViewController") as! HomeViewController
            pushToMenuItem(vc: HomeVc)
        case 2:
            let ProfileVc = storyboard?.instantiateViewController(withIdentifier: "profileViewController") as! ProfileViewController
            pushToMenuItem(vc: ProfileVc)
        case 3:
            
            
            let WorldVC = storyboard?.instantiateViewController(withIdentifier: "WorldScreenViewcontroller") as! WorldScreenViewcontroller
             WorldVC.isFromLeftMenu = true
            pushToMenuItem(vc: WorldVC)
            
        case 4:
            let FeedbackVC = storyboard?.instantiateViewController(withIdentifier: "feedbackViewController") as! FeedbackViewController
            pushToMenuItem(vc: FeedbackVC)
            
        case 5:
            let ContactVC = storyboard?.instantiateViewController(withIdentifier: "contactViewController") as! ContactViewController
            pushToMenuItem(vc: ContactVC)
         
        default:
           return
        }
        
    }
    
    
    func pushToMenuItem(vc : UIViewController){
        self.sideMenuViewController!.setContentViewController(UINavigationController.init(rootViewController: vc), animated: true)
        self.sideMenuViewController!.hideMenuViewController()
    }

    // MARK: - <UITableViewDataSource>

    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //row zero for profile image and name / others for icons
        if (indexPath.row == 0) {
            return 70
        } else {
            return 54
        }
    }

    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection sectionIndex: Int) -> Int {
        return Constants.titles.count + 1
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        //Constants.profileName
        //Constants.profileImgUrl
        let cellIdentifier: String = "Cell"

        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)


            cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: cellIdentifier)
        
            cell!.backgroundColor = UIColor.clear
        
        //row zero for profile image and name / others for icons
            if (indexPath.row == 0) {
                cell!.textLabel?.font = UIFont.init(name: "HelveticaNeue", size: 19)
            } else {
                cell!.textLabel?.font = UIFont.init(name: "HelveticaNeue", size: 16)
            }
        
            cell!.textLabel?.textColor = UIColor.white
            cell!.textLabel?.highlightedTextColor = UIColor.white
            cell!.selectedBackgroundView = UIView.init()

        
        
        if (indexPath.row != 0) {
            cell!.textLabel?.text = NSLocalizedString(Constants.titles[indexPath.row - 1], comment: Constants.titles[indexPath.row - 1])
            cell!.imageView?.image = UIImage.init(named:Constants.titlesImages[indexPath.row - 1])
        } else {
            let text:String! = (Public.currentUser?.profileName) ?? ""
            cell!.textLabel?.text = text
            cell?.imageView?.layer.cornerRadius = 20
            cell?.imageView?.layer.masksToBounds = true
            
            if Public.currentUser?.profileImgUrl != nil && Public.currentUser?.profileImgUrl != ""{
                cell!.imageView?.kf.setImage(with: URL(string: (Public.currentUser?.profileImgUrl)!)!)
            }else{
            cell!.imageView?.image = #imageLiteral(resourceName: "avatar-1")
            }
            
        }

        return cell!
    }
}
