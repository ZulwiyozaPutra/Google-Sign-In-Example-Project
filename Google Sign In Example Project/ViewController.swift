//
//  ViewController.swift
//  Google Sign In Example Project
//
//  Created by Zulwiyoza Putra on 1/31/17.
//  Copyright © 2017 zulwiyozaputra. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import GoogleSignIn

class ViewController: UIViewController, GIDSignInDelegate, GIDSignInUIDelegate {
    
    // Outlets
    
    @IBOutlet weak var gidSignInButton: GIDSignInButton!
    
    @IBOutlet weak var signOutButton: UIButton!

    // App lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().clientID = FIRApp.defaultApp()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        signOutButton.isEnabled = false
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if error == nil {
            
            // Get value of authentication
            guard let authentication = user.authentication else {
                print("There was no authentication returned")
                return
            }
            
            // Get the credential from authentication
            let credential = FIRGoogleAuthProvider.credential(withIDToken: authentication.idToken, accessToken: authentication.accessToken)
            
            FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
                guard error == nil else {
                    print("There was error returned after trying to authenticate with the credential")
                    return
                }
                
                if user != nil {
                    
                    // Set the UI Alert Controller
                    let alert = UIAlertController(title: "Welcome", message: "Welcome to Firebase \(user!.displayName!)", preferredStyle: .alert)
                    
                    // Create actions
                    let okAction = UIAlertAction(title: "Ok", style: .default, handler: { (action) in
                        print("You are in after pressed \(action.title) button")
                        self.gidSignInButton.isEnabled = false
                        self.signOutButton.isEnabled = true
                    })
                    let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: { (action) in
                        print("You cancelled the sign in after pressed \(action.title) button")
                    })
                    
                    // Add actions into alert
                    alert.addAction(okAction)
                    alert.addAction(cancelAction)
                    
                    // Presenting alert
                    self.present(alert, animated: true, completion: nil)
                    
                }
                
            })
            
            
        }
        
    }
    
    @IBAction func signOut(_ sender: Any) {
        
        // Get firebase authentication
        
        let firebaseAuth = FIRAuth.auth()
        
        // Doing sign out by using firebase authentication
        
        do {
            try firebaseAuth?.signOut()
        } catch let signOutError as NSError {
            print("Error signing out \(signOutError)")
        }
        
        self.gidSignInButton.isEnabled = true
        self.signOutButton.isEnabled = false
        
    }

}

