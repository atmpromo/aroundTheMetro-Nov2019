//
//  AddSlider.swift
//  Login-ATM
//
//  Created by Siamak Eshghi on 2018-01-20.
//  Copyright © 2018 SiamakEshghi. All rights reserved.
//

import Foundation
import HDAugmentedReality


extension ARViewController{
    
    
    open override func viewDidLoad() {
        
        setupSlider()
    }
    
    //MARK: -Slider
    func setupSlider()  {
         self.sliderAR = UISlider(frame: CGRect(x: 20, y: self.view.bounds.size.height - 40,width: self.view.bounds.size.width - 40 ,height: 40))
        self.sliderAR!.minimumValue = 1;
        self.sliderAR!.maximumValue = 1500;
        self.sliderAR!.isContinuous = true
        self.sliderAR!.tintColor = UIColor.red
        self.sliderAR!.addTarget(self, action: #selector(self.sliderValueDidChange(_:)), for: .valueChanged)
        self.view.addSubview(self.sliderAR!)
        
        //Setup Slider Lable
        self.sliderlabel = UILabel(frame: CGRect(x: 0 , y: 0, width:80, height: 100))
        self.sliderlabel?.textColor = UIColor.red
        self.sliderlabel?.text = "0 m"
        self.sliderlabel?.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.sliderlabel!)
        
        self.sliderlabel?.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.sliderlabel?.bottomAnchor.constraint(equalTo: (self.sliderAR?.topAnchor)!).isActive = true
        
        
    }
    
    
    @objc func sliderValueDidChange(_ sender:UISlider!)
    {
        let sliderStep:Float = 10;
        let roundedStepValue = round(sender.value / sliderStep) * sliderStep
         sender.value = roundedStepValue
//        print("\(roundedStepValue) m")
       self.sliderlabel!.text = "\(Int(roundedStepValue)) m"
        
        self.presenter.maxDistance = Double(sender.value)
        self.presenter.reload(annotations: self.getAnnotations(), reloadType: .annotationsChanged)
//        // Use this code below only if you want UISlider to snap to values step by step
//        let roundedStepValue = round(sender.value / sliderStep) * sliderStep
//        sender.value = roundedStepValue
        
//        print("Slider step value \(Int(roundedStepValue))")
    }
    

}



