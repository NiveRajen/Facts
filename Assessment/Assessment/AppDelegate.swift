//
//  AppDelegate.swift
//  Assessment
//
//  Created by Patric Phinehas Raj on 14/03/20.
//  Copyright © 2020 Nivedha. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
         NotificationCenter.default.addObserver(self, selector: #selector(reachabilityChanged(_:)), name: ReachabilityChangedNotification, object: nil)
        
        return true
    }

    @objc func reachabilityChanged(_ note: Notification) {
           
           if let reachability = note.object as? Reachability {
               
               DispatchQueue.main.async {
                   if reachability.currentReachabilityStatus == .notReachable {
                       
                   } else {
                      
                   }
               }
           }
       }
}

