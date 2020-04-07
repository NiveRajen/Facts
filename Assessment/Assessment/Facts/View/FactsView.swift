//
//  FactsView.swift
//  Assessment
//
//  Created by All on 17/03/20.
//  Copyright © 2020 Nivedha. All rights reserved.
//

import Foundation
import UIKit

extension FactsViewController {
    
    func initializeView() {
        view.backgroundColor = .white
        
        initialLoad()
        
        addTableView()
    }
    
    func addTableView() {
        tableView = UITableView(frame: view.frame)
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.register(FactsTableViewCell.self, forCellReuseIdentifier: "Facts")
        tableView?.showsVerticalScrollIndicator = false
        tableView?.separatorStyle = .none
        tableView?.backgroundColor = .clear
        tableView?.accessibilityValue = "Facts"
        
        view.addSubview(tableView!)
        
        tableView?.rowHeight = 100
        
        tableView?.translatesAutoresizingMaskIntoConstraints = false
        tableView?.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView?.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 3).isActive = true
        tableView?.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableView?.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
      
        addRefreshControl()
        addEmptyMessage()
    }
  
    func addRefreshControl() {
        tableView?.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
    }
  
    func endRefreshing() {
      tableView?.refreshControl?.endRefreshing()
    }
    
    //MARK:- Show messages
    func addEmptyMessage() {
        emptyMessage = UILabel(frame: CGRect.init(x: 0, y: 0, width: 200, height: 30))
        emptyMessage.text = NSLocalizedString("MESSAGE_NO_RECORDS", comment: "Message for Empty Rows")
        view.addSubview(emptyMessage)
        emptyMessage.translatesAutoresizingMaskIntoConstraints = false
        emptyMessage.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        emptyMessage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emptyMessage.accessibilityValue = "No Records"
        emptyMessage.isHidden = true
    }
    
    func presentError(errorMessage: String) {
        let alert = UIAlertController(title: NSLocalizedString("TITLE_ERROR", comment: "Title for Error"),
                                      message: errorMessage, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: NSLocalizedString("ALERT_OK", comment: "Alert for OK Message"),
                                      style: .cancel,
                                      handler: nil))
        
        DispatchQueue.main.async { [weak self] in
            self?.present(alert, animated: true)
        }
    }
    
    //MARK:- Initial Page Loading
    func initialLoad() {
        welcomeLabel = UILabel()
        view.addSubview(welcomeLabel)
        welcomeLabel.text = NSLocalizedString("LABEL_HELLO", comment: "Label for Hello")
        welcomeLabel.textAlignment = .center
        welcomeLabel.accessibilityValue = "Hi"
        welcomeLabel.font = UIFont.boldSystemFont(ofSize: 25)
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.bringSubviewToFront(welcomeLabel)
        
        activityIndicator = UIActivityIndicatorView()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.widthAnchor.constraint(equalToConstant: 100).isActive = true
        activityIndicator.heightAnchor.constraint(equalToConstant: 100).isActive = true
        view.addSubview(activityIndicator)
        activityIndicator.color = .gray
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicator.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                                                  constant: -65).isActive = true
        activityIndicator.accessibilityValue = "Loading"
        activityIndicator.startAnimating()
        view.bringSubviewToFront(activityIndicator)
    }
    
    func hideInitialView() {
        DispatchQueue.main.async { [weak self] in
            self?.welcomeLabel.isHidden = true
            self?.activityIndicator.stopAnimating()
        }
    }
}
