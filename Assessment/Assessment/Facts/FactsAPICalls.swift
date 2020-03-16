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
        URLSession.shared.dataTask(with:request, completionHandler: { data, response, error in
            guard let data = data, error == nil else {
                print("Error")
                return
            }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: AnyObject?] {
                    print(json)
                }
                
//                guard let archives = try? JSONDecoder().decode(Archives.self, from: data) else {
//                    print("Error: Couldn't decode data into car")
//                    return
//                }
                return
            } catch let error {
                print("Error: \(error.localizedDescription)")
                return
            }

            
        }).resume()
    }
}
