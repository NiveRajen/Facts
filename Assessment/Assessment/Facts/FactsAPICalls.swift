//
//  FactsAPICalls.swift
//  Assessment
//
//  Created by Patric Phinehas Raj on 14/03/20.
//  Copyright © 2020 Nivedha. All rights reserved.
//

import UIKit

class FactsAPICalls: NSObject {
    static let sharedInstance = FactsAPICalls()
    let imageCache = NSCache<NSString, UIImage>()
    
    func getFacts(completionHandler: @escaping (_ respose: Archives?, _ error: String?) -> ())  {
        
        let url = URL(string: "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json")
        let request = URLRequest(url: url!)
        
        URLSession.shared.dataTask(with:request, completionHandler: { data, response, error in
            guard error == nil else {
                completionHandler(nil, error?.localizedDescription)
                return
            }
            
            guard data != nil else {
                completionHandler(nil, NSLocalizedString("MESSAGE_NO_RECORDS", comment: "Message for No Records"))
                return
            }
            
            do {
                let str = String(decoding: data!, as: UTF8.self)
                if !str.isEmpty {
                    let jsonData = str.data(using: .utf8)!
                    if let archiveData = try! JSONDecoder().decode(Archives.self, from: jsonData) as? Archives {
                        completionHandler(archiveData, nil)
                        return
                    }
                }
            } catch let error {
                completionHandler(nil, error.localizedDescription)
                return
            }

            
        }).resume()
    }
    
    func getImage(for url: String, completionHandler: @escaping (_ respose: UIImage?, _ error: String?) -> ()) {
        if !url.isEmpty {
            if let cachedImage = imageCache.object(forKey: url as NSString) {
                completionHandler(cachedImage, nil)
            } else {
                if !Reachability.isConnectedToNetwork() {
                    completionHandler(nil, NSLocalizedString("ALERT_NO_INTERNET", comment: "Alert for No Internet Message"))
                } else {
                    let request = URLRequest(url: URL(string: url)!)
                    URLSession.shared.dataTask(with:request, completionHandler: { data, response, error in
                        if let data = data, let image = UIImage(data: data) {
                            self.imageCache.setObject(image, forKey: url as NSString)
                            completionHandler(image, nil)
                        } else {
                            completionHandler(nil, NSLocalizedString("TITLE_ERROR", comment: "Error Title"))
                        }
                        
                    }).resume()
                }
            }
        } else {
            completionHandler(nil, NSLocalizedString("TITLE_ERROR", comment: "Error Title"))
        }
    }
}
