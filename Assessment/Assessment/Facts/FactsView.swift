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
    
    func setupTheme() {
        view.backgroundColor = .white
    }
    
    func presentError(errorMessage: String) {
        let alert = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        DispatchQueue.main.async {
            self.present(alert, animated: true)
        }
    }
    
    func addEmptyMessageScreen() {
        
    }
}
