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
    
    //MARK:- Activity Indicator View
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
    
    //MARK:- Initial Load - Welcome Message
    static let  welcomeLabel = UILabel()
    func initialLoad() {
        view.addSubview(UIViewController.welcomeLabel)
        UIViewController.welcomeLabel.text = NSLocalizedString("LABEL_HELLO", comment: "Label for Hello")
        UIViewController.welcomeLabel.textAlignment = .center
        UIViewController.welcomeLabel.accessibilityValue = "Hi"
        UIViewController.welcomeLabel.font = UIFont.boldSystemFont(ofSize: 25)
        UIViewController.welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        UIViewController.welcomeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        UIViewController.welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.view.bringSubviewToFront(UIViewController.welcomeLabel)
        
        addLoader()
    }
    
    func hideInitialView() {
        DispatchQueue.main.async {
            UIViewController.welcomeLabel.isHidden = true
            self.stopLoader()
        }
    }
    
    //MARK:- Empty Message
    static var emptyMessage = UILabel()
    func addEmptyMessage() {
        UIViewController.emptyMessage = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
        UIViewController.emptyMessage.text = NSLocalizedString("MESSAGE_NO_RECORDS", comment: "Message for Empty Rows")
        self.view.addSubview(UIViewController.emptyMessage)
        UIViewController.emptyMessage.translatesAutoresizingMaskIntoConstraints = false
        UIViewController.emptyMessage.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        UIViewController.emptyMessage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        UIViewController.emptyMessage.accessibilityValue = "No Records"
        UIViewController.emptyMessage.isHidden = true
    }
    
    func hideEmptyMessage() {
        UIViewController.emptyMessage.isHidden = true
    }
    
    func showEmptyMessage() {
        UIViewController.emptyMessage.isHidden = false
    }
    
    //MARK:- Refresh Controls
    static let refreshControl = UIRefreshControl()
    func addRefreshControl() {
        UIViewController.refreshControl.tintColor = UIColor.red
        UIViewController.refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
    }
    
    @objc func endRefreshing() {
        DispatchQueue.main.async {
            UIViewController.self.refreshControl.endRefreshing()
        }
    }
}
