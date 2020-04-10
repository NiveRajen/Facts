//
//  Extension.swift
//  Assessment
//
//  Created by Govindharaj Murugan on 4/10/20.
//  Copyright © 2020 Nivedha. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    static var activityIndicator = UIActivityIndicatorView()
    
    func addLoader() {
        UIViewController.activityIndicator = UIActivityIndicatorView()
        UIViewController.activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        UIViewController.activityIndicator.widthAnchor.constraint(equalToConstant: 100).isActive = true
        UIViewController.activityIndicator.heightAnchor.constraint(equalToConstant: 100).isActive = true
        view.addSubview(UIViewController.activityIndicator)
        
        UIViewController.activityIndicator.color = .gray
        UIViewController.activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        UIViewController.activityIndicator.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -65).isActive = true
        UIViewController.activityIndicator.accessibilityValue = "Loading"
        UIViewController.activityIndicator.startAnimating()
        self.view.bringSubviewToFront(UIViewController.activityIndicator)
    }
    
    func stopLoader() {
        UIViewController.activityIndicator.stopAnimating()
    }
}
