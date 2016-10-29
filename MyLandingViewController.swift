//
//  LandingViewController.swift
//  quickapps
//
//  Created by QUICK APPS STUDIOS on 15/10/2016.
//  Copyright © 2016 QUICK APPS STUDIOS. All rights reserved.
//

import UIKit

import Firebase
import FirebaseDatabase


class MyLandingViewController: UIViewController,UITextFieldDelegate {
    
    
    @IBOutlet weak var sendButton: UIButton!
    
    
    @IBOutlet weak var textField: UITextField!
    
    
    //Firebase Reference
    
    var databaseRef: FIRDatabaseReference{
        
        
        return FIRDatabase.database().reference()
    }
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        //customize button
        
        
        sendButton.layer.borderWidth = 3
        sendButton.layer.cornerRadius = 10
        sendButton.layer.borderColor = UIColor.orange.cgColor
        
        
       textField.delegate = self
        
        
        let tappedGesture = UITapGestureRecognizer(target: self, action: #selector(MyLandingViewController.dissmissKeyboard))
        
        tappedGesture.numberOfTapsRequired = 1
        
        self.view.addGestureRecognizer(tappedGesture)
        
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(MyLandingViewController.dissmissKeyboard))
        
        swipeDown.direction = .down
        self.view.addGestureRecognizer(swipeDown)
        
    }
    
    
    
    func dissmissKeyboard() {
        
        self.view.endEditing(true)
        
    }
    
    
    //animate keyboard my moving up
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        animateViewup(true, moveValue: -230)
        
        
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        
        animateViewup(false, moveValue: -230)
    }
    

    
    
    
    fileprivate func animateViewup(_ up:Bool, moveValue:CGFloat){
        
        let movementDuaraion: TimeInterval = 0.3
        
        let movement: CGFloat = (up ? -moveValue : moveValue)
        
        UIView.beginAnimations("animateView", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(movementDuaraion)
        self.view.frame = self.view.frame.offsetBy(dx: 0, dy: movement)
        UIView.commitAnimations()
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //dismiss keyboard
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       
        
        textField.resignFirstResponder()
        return true
    }
    
    
    
    
    // Send Button we will go to home page
    @IBAction func sendTapped(_ sender: Any) {
        
        
        
        
        let email = textField.text!.lowercased()
        
        //let finalEmail = email.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        
        let finalEmail = email
        
        if finalEmail.isEmpty || finalEmail.characters.count < 8 {
            
           
            
           
            
            
            
            ///Custom AlertView Show on error
            
            
           
            
          let alertView = SCLAlertView()
            
            alertView.showNotice("Hey", subTitle:"It seems you did not enter a vailid email. Please try again")
            
        }else{
            
            
           
            
            
            
            
            
            
            
            //save users email to firebase
            
            
            let emailListRef = databaseRef.child("emailList").childByAutoId()
            let emailinfo = ["email":finalEmail]
            
            
            emailListRef.setValue(emailinfo) { (error, ref) -> Void in

           
            if error == nil{
                
                
                
                //we go to the home controller
                    
                    let SWRevealViewController = UIStoryboard(name:"Main", bundle:nil).instantiateViewController(withIdentifier: "Menu")
                
                let alertView = SCLAlertView()
                
                
                //success notification
                
                
               let successView =  SCLAlertView()
                
                SCLAlertView().showTitle(
                    "Congratulations", // Title of view
                    subTitle: "Operation successfully completed.", // String of view
                    duration: 10.0, // Duration to show before closing automatically, default: 0.0
                    completeText: "Done", // Optional button value, default: ""
                    style: .success, // Styles - see below.
                    colorStyle: 0xA429FF,
                    colorTextButton: 0xFFFFFF
                )
                
            
                
                ///go to home screen
                
                
                self.present(SWRevealViewController,animated:true, completion:nil)
                self.view.endEditing(true)
  
                }else{
                    
                    
                    //error notification
                    let alertView = SCLAlertView()
                
                    
                    alertView.showNotice("Hey", subTitle:"OPPS Please try again")
                }
                
}
            
        print("Email saved")
            
        }
        
    }
    
    
    
    //Thanks Button
    
    func thanksTapped(_ sender: Any) {
        
        
        
        
        
        
    }

    

}



