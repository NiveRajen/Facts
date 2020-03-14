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
    
    
     func getFacts()  {
        let url = URL(string: "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json")
        let request = URLRequest(url: url!)
        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error in
            if let error = error {
                print("Error in fetching data")
            }
            
        }).resume()
    }
}
