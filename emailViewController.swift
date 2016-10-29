//
//  emailViewController.swift
//  quickapps
//
//  Created by QUICK APPS STUDIOS on 14/10/2016.
//  Copyright © 2016 QUICK APPS STUDIOS. All rights reserved.
//

import UIKit
import MessageUI

class emailViewController: UIViewController,MFMailComposeViewControllerDelegate {
    
    
    @IBOutlet weak var menuBar: UIBarButtonItem!
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

       
        //set title to quickapps
        self.navigationItem.title = "Email Us"
        
        
        slideMenu()
        
        
        
 }
    
    
    
    
    
    
    //bar menu slider//
    
    func slideMenu(){
        
      
        
        //burger slide menu
        
        if revealViewController() != nil {
            
            menuBar.target = revealViewController()
            menuBar.action = #selector(SWRevealViewController.revealToggle(_:))
            
            
            //slide out menu
            
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
            
            
            //customize width of menu
            
            self.revealViewController().rearViewRevealWidth = 210

    }
    
    }
    
    
    //send email
    
    @IBAction func sendBtn(_ sender: Any) {
        
        
        
        let receiptents = ["quickappsmarketing@gmail.com"]
        let title = "Get a Quote"
        
        let message = "Email Our Team"
        
        
        
        let mc:MFMailComposeViewController = MFMailComposeViewController()
        
        mc.mailComposeDelegate = self
        
        mc.setToRecipients(receiptents)
        mc.setSubject(title)
        mc.setMessageBody(message, isHTML: false)
        
        self.present(mc,animated: true, completion:nil)

        
    }
    
    
    
    
    
    //if cancelled
    
    
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {

        
        //switch result.rawValue{
            
            
        //case MFMailComposeResultCancelled.rawValue:
            
           // print("Cancelled")
            
            
        //case MFMailComposeResultFailed.rawValue:
            
            //print("failed")
            
            
            
        //case MFMailComposeResultSave.rawValue:
            
           // print("save")
            
            
            
        //case MFMailComposeResultSent.rawValue:
            
           // print("sent")
            
            
        //default:
            
               // break
            
            
    //}
        
        ///if cancellled
        
        self.dismiss(animated: true, completion: nil)
        
        
        
        
        
        
        
        
        
        
        
        
    
    
        
        
        
    }
    
}


