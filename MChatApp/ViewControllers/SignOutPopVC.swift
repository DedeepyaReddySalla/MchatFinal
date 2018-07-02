//
//  SignOutPopVC.swift
//  MChatApp
//
//  Created by Dedeepya reddy Salla on 7/1/18.
//  Copyright © 2018 Motion Mentoring Org. All rights reserved.
//

import UIKit
import FirebaseAuth
import GoogleSignIn

protocol signOutDelegate {
    func authsignOut()
}

class SignOutPopVC: UIViewController {
     @IBOutlet weak var userEmailLBL: UILabel!
    var signOutDelegate : signOutDelegate?
     var userName:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
         userEmailLBL.text = userName
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        userEmailLBL.text = userName
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //First pop-up is dismissed and then sign out functionality is implemented
    @IBAction func signOut(_ sender: Any) {
        self.dismiss(animated:true, completion:nil)
        signOutDelegate?.authsignOut()
    }
    
   
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
