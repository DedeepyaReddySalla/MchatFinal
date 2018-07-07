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
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        userEmailLBL.text = userName
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //First pop-up is dismissed and then sign out functionality is implemented
    @IBAction func signOut(_ sender: Any) {
        self.dismiss(animated:true, completion:nil)
        signOutDelegate?.authsignOut()
    }
    
}
