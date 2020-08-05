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

    let cellIdentifier: String = "Cell"
    
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
        let tableView: UITableView = UITableView.init(frame: CGRect(x: 0, y: (self.view.frame.size.height - (70 + 54 * 8)) / 2.0, width: self.view.frame.size.width, height:(70 + 54 * 8)), style: .plain)
        tableView.autoresizingMask = [.flexibleTopMargin, .flexibleBottomMargin, .flexibleWidth]
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isOpaque = false
        tableView.backgroundColor = .clear
        tableView.backgroundView = nil
        tableView.separatorStyle = .none
        tableView.bounces = false

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        
        self.tableView = tableView
        self.view.addSubview(self.tableView!)
        
    }

    // MARK: - <UITableViewDelegate>

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        switch menuIndex(from: indexPath) {
        case Constants.MenuItems.home.rawValue:
           let HomeVc = storyboard?.instantiateViewController(withIdentifier: "homeViewController") as! HomeViewController
            pushToMenuItem(vc: HomeVc)
        case Constants.MenuItems.profile.rawValue:
            guard Features.isLoginEnabled else { fallthrough }
            if Public.currentUser == nil {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let loginVc = storyboard.instantiateViewController(withIdentifier: "loginViewController") as! LoginViewController
                loginVc.didDismiss = { [weak self] in
                    self?.tableView?.reloadData()
                }
                self.present(loginVc, animated: true, completion: nil)
            } else {
                let ProfileVc = storyboard?.instantiateViewController(withIdentifier: "profileViewController") as! ProfileViewController
                pushToMenuItem(vc: ProfileVc)
            }
        case Constants.MenuItems.changeCity.rawValue:
            let WorldVC = storyboard?.instantiateViewController(withIdentifier: "WorldScreenViewcontroller") as! WorldScreenViewcontroller
             WorldVC.isFromLeftMenu = true
            pushToMenuItem(vc: WorldVC)
        case Constants.MenuItems.contactUs.rawValue:
            let ContactVC = storyboard?.instantiateViewController(withIdentifier: "contactViewController") as! ContactViewController
            pushToMenuItem(vc: ContactVC)
        default:
           return
        }
        
    }
    
    
    func pushToMenuItem(vc : UIViewController) {
        self.sideMenuViewController!.setContentViewController(UINavigationController.init(rootViewController: vc), animated: true)
        self.sideMenuViewController!.hideMenuViewController()
    }

    // MARK: - <UITableViewDataSource>

    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //row zero for profile image and name / others for icons
        if indexPath.row == 0, Features.isLoginEnabled {
            return 70
        } else {
            return 54
        }
    }

    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection sectionIndex: Int) -> Int {
        return Constants.MenuItems.allCases.count + (Features.isLoginEnabled ? 1 : -1)
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) else {
            fatalError("Unable to dequeue cell")
        }

        cell.backgroundColor = UIColor.clear
        
        // row zero for profile image and name / others for icons
        if indexPath.row == 0, Features.isLoginEnabled {
            cell.textLabel?.font = UIFont.init(name: "HelveticaNeue", size: 19)
        }
        else {
            cell.textLabel?.font = UIFont.init(name: "HelveticaNeue", size: 16)
        }
        
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.highlightedTextColor = UIColor.white
        cell.selectedBackgroundView = UIView()
        
        if indexPath.row != 0 || !Features.isLoginEnabled {
            let text = fetchLanguageLocalization(index: menuIndex(from: indexPath))
            let imageName = Constants.MenuItems(rawValue: menuIndex(from: indexPath))?.item.titleImageName ?? ""
            
            cell.textLabel?.text =  text
            cell.imageView?.image = UIImage(named: imageName)
        }
        else {
            let text:String! = (Public.currentUser?.profileName) ?? ""
            
            cell.textLabel?.text = text
            
            cell.imageView?.layer.cornerRadius = 20
            cell.imageView?.layer.masksToBounds = true
            
            if Public.currentUser?.profileImgUrl != nil && Public.currentUser?.profileImgUrl != "" {
                cell.imageView?.kf.setImage(with: URL(string: (Public.currentUser?.profileImgUrl)!)!)
            }
            else {
                cell.imageView?.image = #imageLiteral(resourceName: "avatar-1")
            }
        }

        return cell
    }

    func fetchLanguageLocalization(index: Int) -> String {
        let key = Constants.MenuItems(rawValue: index)?.item.title ?? ""

        let strLanguageSelected = UserDefaults.standard.fetchSelectedLanguage()
        let strLocalized = key.localizedToLanguage(languageSymbol: strLanguageSelected)
        
        return strLocalized
    }

    private func menuIndex(from indexPath: IndexPath) -> Int {
        var index = indexPath.row - (Features.isLoginEnabled ? 1 : 0)
        if !Features.isLoginEnabled, index > 0 {
            index += 1
        }

        return index
    }
}
