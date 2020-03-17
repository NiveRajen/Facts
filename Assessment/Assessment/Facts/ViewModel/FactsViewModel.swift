//
//  FactsViewModel.swift
//  Assessment
//
//  Created by All on 17/03/20.
//  Copyright © 2020 Nivedha. All rights reserved.
//

import Foundation

extension FactsViewController {
    func bindData(archive: Archives) {
        archiveRecords = archive
        
        if let title = archiveRecords?.title {
            DispatchQueue.main.async {
                self.navigationController?.navigationBar.topItem?.title = title
            }
        }
        
        showHideEmptyMessage()
        
        DispatchQueue.main.async {
            self.tableView?.reloadData()
        }
    }
    
    func showHideEmptyMessage() {
        DispatchQueue.main.async { [weak self] in
            if let _ = self?.archiveRecords?.rows {
                if (self?.archiveRecords?.rows.count)! == 0 {
                    self?.emptyMessage.isHidden = false
                    self?.tableView?.separatorStyle = .none
                } else {
                    self?.emptyMessage.isHidden = true
                    self?.tableView?.separatorStyle = .singleLine
                }
            } else {
                self?.emptyMessage.isHidden = false
                self?.tableView?.separatorStyle = .none
            }
        }
    }
}
