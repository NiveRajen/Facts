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

    }
    
    func setupTheme() {
        view.backgroundColor = .white
    }
    
    func presentError(errorMessage: String) {
        let alert = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        
        DispatchQueue.main.async { [weak self] in
            self?.present(alert, animated: true)
        }
    }
    
    func addEmptyMessageScreen() {
        
    }
}
