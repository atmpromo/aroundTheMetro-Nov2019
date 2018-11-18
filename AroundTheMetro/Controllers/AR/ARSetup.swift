//
//  ARSetup.swift
//  Login-ATM
//
//  Created by Siamak Eshghi on 2018-01-20.
//  Copyright © 2018 SiamakEshghi. All rights reserved.
//
import UIKit
import CoreLocation
import HDAugmentedReality
import PopupDialog
import Kingfisher



//MARK: - ARDatasource function
extension ARListViewController: ARDataSource{
    
    //MARK: - Setup arViewController
    func displayAR(){
        arViewController = ARViewController()
       
        arViewController.dataSource = self
        arViewController.presenter.distanceOffsetMode = .manual
        arViewController.presenter.maxVisibleAnnotations = 30
        arViewController.presenter.distanceOffsetMultiplier = 0.1
       
        //I need maxDistance == 0 because of using slider but in the library 0 mean infinitive so I used 1 insted.
        arViewController.presenter.maxDistance = 1
        arViewController.uiOptions.debugMap = true
        arViewController.setAnnotations(selectedPlaces!)
       
        self.present(arViewController, animated: true, completion: nil)
    }
    
    func ar(_ arViewController: ARViewController, viewForAnnotation: ARAnnotation) -> ARAnnotationView {
        let annotationView = AnnotationView()
        annotationView.annotation = viewForAnnotation
        annotationView.delegate = self
        annotationView.frame = CGRect(x: 0, y: 0, width: 150, height: 80)
        
        return annotationView
    }
    
    
 
}



