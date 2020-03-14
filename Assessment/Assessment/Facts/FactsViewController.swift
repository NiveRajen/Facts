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
        FactsAPICalls.sharedInstance.getFacts()
    }


}
