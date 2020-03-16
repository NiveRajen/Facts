//
//  FactsViewController.swift
//  Assessment
//
//  Created by Patric Phinehas Raj on 14/03/20.
//  Copyright © 2020 Nivedha. All rights reserved.
//

import UIKit

class FactsViewController: UIViewController {
    
    var archiveRecords : Archives? = nil
    
    var tableView : UITableView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeView()
        
        setupTheme()
        
        downloadContent()
    }
    
    func downloadContent() {
        FactsAPICalls.sharedInstance.getFacts { (archives, error) in
            if error != nil {
                self.presentError(errorMessage: error!)
            } else if archives != nil {
                self.bindData(archive: archives!)
            } else {
                self.presentError(errorMessage: "No Data")
            }
        }
    }

    
}

extension FactsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return archiveRecords?.rows.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let factsCell = tableView.dequeueReusableCell(withIdentifier: "Facts") as? FactsTableViewCell
        return factsCell!
    }
}
