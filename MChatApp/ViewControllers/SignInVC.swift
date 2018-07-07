//
//  SignInVC.swift
//  MChatApp
//
//  Created by Dedeepya reddy Salla on 7/1/18.
//  Copyright © 2018 Motion Mentoring Org. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class SignInVC: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate {
    @IBOutlet weak var googlSignInCustomBtn: GIDSignInButton!
    var activityIndicatr:UIActivityIndicatorView = UIActivityIndicatorView()
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        
    //button customization
         googlSignInCustomBtn.isHidden = false
         googlSignInCustomBtn.center = view.center

//        let btnSize: CGFloat = 200
//        googlSignInCustomBtn.layer.cornerRadius = 10
//        googlSignInCustomBtn.layer.masksToBounds = true
//        googlSignInCustomBtn.layer.borderColor = UIColor.gray.cgColor
//        googlSignInCustomBtn.layer.borderWidth = 1
//        googlSignInCustomBtn.layer.shadowColor = UIColor.gray.cgColor
//        googlSignInCustomBtn.layer.shadowOffset = CGSize(width:200, height: 200)
//        googlSignInCustomBtn.frame = CGRect(x: 0, y: 0, width:btnSize, height:btnSize)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func sign(inWillDispatch signIn: GIDSignIn!, error: Error!) {
        googlSignInCustomBtn.isHidden = true
    }
    //After signs  into his gmail account n gives permission, this method is called
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
        
        loadingStarted() //using activity indicator to indicate loading
        if let error = error {
            print(error.localizedDescription)
            return
        }
        
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                       accessToken: authentication.accessToken)
        // ...
        let submitVC:SubmitQstnVC = (storyboard!.instantiateViewController(withIdentifier: "SubmitQstnVCIden") as? SubmitQstnVC)!
        //app signing in to get user credentials from gmail server, using tokens
        Auth.auth().signIn(with: credential) { (user, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
             self.loadingEnded() //stopping activity indicator as all loading will be done by this line
            //MARK: - Navigation
            if let userName = user?.email{
                print(userName as Any)
                //MARK:  - Saving user state
                UserDefaults.standard.set(true, forKey: "userLoggedIn")
                UserDefaults.standard.set(userName, forKey: "user")
                submitVC.userName = userName
                self.navigationController?.pushViewController(submitVC, animated: true)
            }
        }// end of auth signing in
        
    }

    func loadingStarted(){
        activityIndicatr.center = self.view.center
        activityIndicatr.hidesWhenStopped = true
        activityIndicatr.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        view.addSubview(activityIndicatr)
        activityIndicatr.startAnimating()
    }
    
    func loadingEnded(){
       activityIndicatr.stopAnimating()
    }
    
//    func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
//        self.navigationController?.popViewController(animated: true)
//      let vc = segue.destination as? SubmitQstnVC
//        vc?.signInVCObj = self
//    }
}
