//
//  AppDelegate.swift
//  Google Sign In Example Project
//
//  Created by Zulwiyoza Putra on 1/31/17.
//  Copyright © 2017 zulwiyozaputra. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // To connect Firebase when the app starts up
        FIRApp.configure()
        
        return true
    }

}

