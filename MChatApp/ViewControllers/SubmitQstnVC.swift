//
//  SubmitQstnVC.swift
//  MChatApp
//
//  Created by Dedeepya reddy Salla on 7/1/18.
//  Copyright © 2018 Motion Mentoring Org. All rights reserved.
//

import UIKit
import MessageUI
import FirebaseAuth
import GoogleSignIn


class SubmitQstnVC: UIViewController, UITextViewDelegate, MFMailComposeViewControllerDelegate, UIPopoverPresentationControllerDelegate, signOutDelegate{
    //    var signInVCObj:SignInVC?
    @IBOutlet weak var userNameLBL: UILabel!
     var userName:String?
    @IBOutlet weak var qstnTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        qstnTextView.delegate = self
        var viewControllers = navigationController?.viewControllers
//        print(" COUNT \(String(describing: viewControllers?.count))")
        if(viewControllers?.count == 3){
            viewControllers?.remove(at:1) //here 2 views to pop index numbers of views
            navigationController?.setViewControllers(viewControllers!, animated: true)
        }
//        let button1 = UIBarButtonItem(image: UIImage(named: "imagename"), style: .plain, target: self, action: Selector("action"))
        let profileBarBtn = UIBarButtonItem(title:"Profile", style:UIBarButtonItemStyle.plain, target:self, action:#selector(SubmitQstnVC.profile(_:)))
        self.navigationItem.rightBarButtonItem  = profileBarBtn
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func profile(_ sender: Any) {
            let vc = storyboard?.instantiateViewController(withIdentifier:"popOver") as! SignOutPopVC
            vc.signOutDelegate = self
            vc.userName = userName
    //        vc.userEmailLBL.text = userName
    //        vc.preferredContentSize = CGSize(width:100, height:100)
            vc.preferredContentSize = CGSize(width:(UIScreen.main.bounds.width)*0.5, height:100)
            vc.modalPresentationStyle = UIModalPresentationStyle.popover
            let popOver = vc.popoverPresentationController
            popOver?.delegate = self
            popOver?.barButtonItem = sender as? UIBarButtonItem
            self.present(vc, animated:true, completion:nil)
        }

    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    
    //in signOut first, app is signed out from firebase and then submit vc is removed from stack
    func authsignOut(){
        if Auth.auth().currentUser != nil {
            UserDefaults.standard.set(false, forKey: "userLoggedIn")
            GIDSignIn.sharedInstance().signOut()
        }
        self.goToHomePage()
    }

    func goToHomePage()
    {
        self.navigationController?.popToRootViewController(animated:true)
    }
    
    @IBAction func submitQstn(_ sender: Any) {
        print(qstnTextView.text)
        let mailComposeViewController = configureMFMailComposer()
        if MFMailComposeViewController.canSendMail(){
            self.present(mailComposeViewController, animated: true, completion:nil)
        }else{
            showEmailError()
        }
    }
    
    // MARK:- MFMailComposer Delegates
    func configureMFMailComposer() -> MFMailComposeViewController{
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        mailComposerVC.setToRecipients(["dedeepyareddy255@gmail.com"])
        mailComposerVC.setSubject("Need suggestion")
        mailComposerVC.setMessageBody(qstnTextView.text, isHTML:false)
        //mailComposerVC.setMessageBody("message body", isHTML:false)
        return mailComposerVC
    }
    
    func showEmailError(){
        let sendMailErrorAlert = UIAlertController(title:"Error", message:"There is no email setUp", preferredStyle: .alert)
        let dismiss = UIAlertAction(title:"Ok", style:.default, handler:nil)
        sendMailErrorAlert.addAction(dismiss)
        self.present(sendMailErrorAlert, animated:true, completion:nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated:true, completion:nil)
    }

  // MARK:- TextView Delegate
    
   func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        return true
    }

}
