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
        
        addTableView()
    }
    
    func addTableView() {
        tableView = UITableView(frame: view.frame)
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.register(FactsTableViewCell.self, forCellReuseIdentifier: "Facts")
        tableView?.showsVerticalScrollIndicator = false
        
        view.addSubview(tableView!)
        
        tableView?.rowHeight = 100
        
        tableView?.translatesAutoresizingMaskIntoConstraints = false
        tableView?.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView?.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView?.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableView?.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        addEmptyMessage()
    }
    
    func addEmptyMessage() {
        emptyMessage = UILabel(frame: CGRect.init(x: 0, y: 0, width: 200, height: 30))
        emptyMessage.text = NSLocalizedString("MESSAGE_NO_RECORDS", comment: "Message for Empty Rows")
        view.addSubview(emptyMessage)
        emptyMessage.translatesAutoresizingMaskIntoConstraints = false
        emptyMessage.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        emptyMessage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emptyMessage.isHidden = true
    }
    
    func presentError(errorMessage: String) {
        let alert = UIAlertController(title: NSLocalizedString("TITLE_ERROR", comment: "Title for Error"), message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("ALERT_OK", comment: "Alert for OK Message"), style: .cancel, handler: nil))
        
        DispatchQueue.main.async { [weak self] in
            self?.present(alert, animated: true)
        }
    }
}
