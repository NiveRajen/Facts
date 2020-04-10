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
    
    var response: ((_ error: String?) -> Void)?
    var archives: Archives?
    let imageCache = NSCache<NSString, UIImage>()
    
    //MARK:- API Calls
    //Download Datas
    func downloadContent() {
        if Utils.shared.networkIsReachable() {
            FactsAPICalls.sharedInstance.getFacts { (archives, error) in
                self.archives = archives
                if error != nil {
                    self.response?(error!)
                }
                else if archives != nil {
                    self.response?(nil)
                }
                else {
                    self.response?(NSLocalizedString("MESSAGE_NO_DATA", comment: "Message for No Data"))
                }
            }
        } else {
            self.response?(NSLocalizedString("ALERT_NO_INTERNET", comment: "Alert for No Internet Message"))
        }
    }
    
    //Download Image
    func getImage(url: String, completion: @escaping (_ image: UIImage?, _ error: String? ) -> Void) {
        if !url.isEmpty {
            if let cachedImage = imageCache.object(forKey: url as NSString) {
                completion(cachedImage, nil)
            } else {
                if  Utils.shared.networkIsReachable() {
                    FactsAPICalls.sharedInstance.downloadImage(for: url) { data, error in
                        if let error = error {
                            completion(nil, error)
                            
                        } else if let data = data, let image = UIImage(data: data) {
                            self.imageCache.setObject(image, forKey: url as NSString)
                            completion(image, nil)
                        } else {
                            self.imageCache.setObject(UIImage(named: "placeholder")!, forKey: url as NSString)
                            completion(nil, NSLocalizedString("TITLE_ERROR", comment: "Error Title"))
                        }
                    }
                } else {
                    completion(nil, NSLocalizedString("ALERT_NO_INTERNET", comment: "Alert for No Internet Message"))
                }
            }
        } else {
            self.imageCache.setObject(UIImage(named: "placeholder")!, forKey: url as NSString)
            completion(nil, NSLocalizedString("TITLE_ERROR", comment: "Error Title"))
        }
    }
}
