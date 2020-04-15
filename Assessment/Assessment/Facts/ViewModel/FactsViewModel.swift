//
//  FactsViewModel.swift
//  Assessment
//
//  Created by All on 17/03/20.
//  Copyright © 2020 Nivedha. All rights reserved.
//

import Foundation
import UIKit

class FactsViewModel {
    
    var response: ((_ success : Bool, _ error: String) -> Void)?
    var archives: Archives?
    var archiveName = ""
    var message: String?
    
    //MARK:- API Calls
    //Download Datas
    func downloadContent() {
        if Reachability.isConnectedToNetwork() {
            FactsAPICalls.sharedInstance.getFacts { (archives, error) in
                if error == nil {
                    self.archives = archives
                    self.archiveName = archives?.title ?? ""
                    self.response?(true, "")
                } else {
                    self.message = error
                    self.response?(false, error!)
                }
            }
        } else {
            self.message = NSLocalizedString("ALERT_NO_INTERNET", comment: "The Internet connection appears to be offline.")
            self.response?(false, self.message!)
        }
    }
}
