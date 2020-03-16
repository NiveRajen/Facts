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
            self.title = title
        }
        
        if (archiveRecords?.rows.count)! == 0 {
            addEmptyMessageScreen()
        }
    }
}
