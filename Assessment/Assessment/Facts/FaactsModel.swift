//
//  FaactsModel.swift
//  Assessment
//
//  Created by Patric Phinehas Raj on 14/03/20.
//  Copyright © 2020 Nivedha. All rights reserved.
//

import Foundation

public struct Archives: Codable {
    var title: String
    var rows: Facts
}

public struct Facts: Codable {
    var title: String
    var description: String
    var imageHref: String
}
