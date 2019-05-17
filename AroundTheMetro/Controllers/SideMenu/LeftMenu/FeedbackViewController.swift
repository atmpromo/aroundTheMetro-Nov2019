//
//  FeedbackViewController.swift
//  AroundTheMetro
//
//  Created by Sukhdev Patidar on 17/05/19.
//  Copyright © 2019 AugmentedDiscovery. All rights reserved.
//

import UIKit

class FeedbackViewController: UIViewController {

    @IBOutlet weak var feedbackCommenyTV: UITextView!
    @IBOutlet weak var sendButton: UIButton!
    
    @IBOutlet var smileyButtons: [UIButton]!
    
    var selectedSmiley = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Send button
        sendButton.layer.borderWidth = 1
        sendButton.layer.borderColor = UIColor.black.cgColor
        sendButton.layer.cornerRadius = 4
        
        //Feedback comment text view
        feedbackCommenyTV.layer.borderWidth = 1
        feedbackCommenyTV.layer.borderColor = UIColor.black.cgColor
        
        
    }
    
    @IBAction func smileyClick(_ sender: Any) {
        
        let smileyButton = sender as! UIButton
        NSLog("Smiley Button Tag \(smileyButton.tag)")
        
        self.selectedSmiley = smileyButton.tag
        for button in self.smileyButtons {
            if button.tag == self.selectedSmiley {
                button.layer.borderWidth = 1
                button.layer.borderColor = UIColor.black.cgColor
            } else {
                button.layer.borderWidth = 0
                button.layer.borderColor = UIColor.clear.cgColor
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func sendButtonClick(_ sender: Any) {
    }
    
}
