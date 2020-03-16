//
//  FactsViewController.swift
//  Assessment
//
//  Created by Patric Phinehas Raj on 14/03/20.
//  Copyright © 2020 Nivedha. All rights reserved.
//

import UIKit

class FactsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        downloadContent()
        // Do any additional setup after loading the view.
    }
    
    func downloadContent() {
        FactsAPICalls.sharedInstance.getFacts { (archives, error) in
            if error != nil {
                self.presentError(errorMessage: error!)
            } else {
                
            }
        }
    }

    func presentError(errorMessage: String) {
        let alert = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
    }
}
