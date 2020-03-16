//
//  FaactsModel.swift
//  Assessment
//
//  Created by Patric Phinehas Raj on 14/03/20.
//  Copyright © 2020 Nivedha. All rights reserved.
//

import Foundation

public struct Archives: Codable {
    let title: String
    let rows: [Rows]
    
    enum CodingKeys : String, CodingKey {
        case title = "name"
        case rows = "Rows"
    }
}

public struct Rows: Codable {
    let title: String?
    let description: String?
    let imageHref: String?
}
