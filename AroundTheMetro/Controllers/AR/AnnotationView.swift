//
//  AnnotationView.swift
//  Login-ATM
//
//  Created by Siamak Eshghi on 2018-01-03.
//  Copyright © 2018 SiamakEshghi. All rights reserved.
//

import UIKit
import HDAugmentedReality

protocol AnnotationViewDelegate {
    func didTouch(annotationView: AnnotationView)
}

class AnnotationView: ARAnnotationView {
    var titleLabel: UILabel?
    var distanceLabel: UILabel?
    var delegate: AnnotationViewDelegate?
    var iconImageView: UIImageView?
   
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        setUpPlacesInArView()
    }
    
    
    

    
    //MARK: HDAugmentedReality Functions
    func setUpPlacesInArView() {
        titleLabel?.removeFromSuperview()
        distanceLabel?.removeFromSuperview()
        iconImageView?.removeFromSuperview()
        
        let imageView = UIImageView(frame: CGRect(x: Double(self.frame.size.width/2 - 25), y: 0, width: 50, height: 50))
        self.addSubview(imageView)
        self.iconImageView = imageView
        
        let label = UILabel(frame: CGRect(x: 0, y: 50, width: self.frame.size.width , height: 30))
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.backgroundColor = UIColor(white: 0.3, alpha: 0.7)
        label.textColor = UIColor.white
        label.textAlignment = .center
        self.addSubview(label)
        self.titleLabel = label
        
        distanceLabel = UILabel(frame: CGRect(x: 0, y: 80, width: self.frame.size.width , height: 20))
        distanceLabel?.backgroundColor = UIColor(white: 0.3, alpha: 0.7)
        distanceLabel?.textColor = UIColor.green
        distanceLabel?.font = UIFont.systemFont(ofSize: 12)
        distanceLabel?.textAlignment = .center
        self.addSubview(distanceLabel!)
        
        if let annotation = annotation as? ARPlace{
            titleLabel?.text = annotation.placeName
//
//            if annotation.distanceFromUser > 1000 {
//                distanceLabel?.text = String(format: "%.2f km", annotation.distanceFromUser / 1000)
//
//            }else{
                distanceLabel?.text = "\(Int(annotation.distanceFromUser)) m"
//            }
            
            switch annotation.type {
            case "Restaurant":
                iconImageView?.image = #imageLiteral(resourceName: "resto-listicon")
                break;
                
            case "Boutique":
                iconImageView?.image = #imageLiteral(resourceName: "boutique-listicon")
                break;
                
            case "Beauty & Health":
                iconImageView?.image = #imageLiteral(resourceName: "salon-iconlist")
                break;
            case "Attraction":
                iconImageView?.image = #imageLiteral(resourceName: "attraction-iconlist")
                break;
                

            default:
                break
            }
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        iconImageView?.frame = CGRect(x: Double(self.frame.size.width/2 - 25), y: 0, width: 50, height:50)
        titleLabel?.frame = CGRect(x: 0, y: 50, width: self.frame.size.width , height: 30)
        distanceLabel?.frame = CGRect(x: 0, y: 80, width: self.frame.size.width , height: 20)
        
    }
    
        override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
            delegate?.didTouch(annotationView: self)
        }
    
}
