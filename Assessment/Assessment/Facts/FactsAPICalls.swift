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
    
    
    func getFacts(completionHandler: @escaping (_ respose: Archives?, _ error: String?) -> ())  {
        let url = URL(string: "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json")
        let request = URLRequest(url: url!)
        //TODO:- Check Reachability
        URLSession.shared.dataTask(with:request, completionHandler: { data, response, error in
            if error != nil {
                completionHandler(nil, error?.localizedDescription)
            }
            if data == nil {
                completionHandler(nil, "No Records")
            }
            
            do {
                let str = String(decoding: data!, as: UTF8.self)
                if !str.isEmpty {
                    let jsonData = str.data(using: .utf8)!
                    if let archiveData = try! JSONDecoder().decode(Archives.self, from: jsonData) as? Archives {
                        completionHandler(archiveData, nil)
                    }
                }
            } catch let error {
                completionHandler(nil, error.localizedDescription)
            }

            
        }).resume()
    }
}
