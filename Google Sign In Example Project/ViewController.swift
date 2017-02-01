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

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().clientID = FIRApp.defaultApp()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

