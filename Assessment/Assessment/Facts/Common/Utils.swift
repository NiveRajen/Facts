//
//  Utils.swift
//  Assessment
//
//  Created by Govindharaj Murugan on 4/10/20.
//  Copyright © 2020 Nivedha. All rights reserved.
//

import UIKit

class Utils: NSObject {
    
    var reachability : Reachability? = nil
    static var shared = Utils()
    
    //MARK:- Network Reachability
    func networkIsReachable() -> Bool {
        if reachability == nil {
            do {
                reachability = try Reachability()
                
                NotificationCenter.default.addObserver(self, selector: #selector(networkStatusChanged), name: .reachabilityChanged, object: reachability)
                
            } catch {
                print("Unable to start notifier")
            }
        }
        return reachability?.connection == .wifi || reachability?.connection == .cellular
    }
    
    @objc func networkStatusChanged() {
        //Network Status changed
    }
}
