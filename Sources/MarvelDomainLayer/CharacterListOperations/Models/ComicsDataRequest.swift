//
//  File.swift
//  
//
//  Created by Erkut Bas on 14.09.2021.
//

import Foundation

public struct ComicsDataRequest: Codable {
    
    public var orderBy: String = "-onsaleDate"
    public var limit: Int = 10
    
    public init(orderBy: String = "-onsaleDate", limit: Int = 10) {
        self.orderBy = orderBy
        self.limit = limit
    }
    
    enum CodingKeys: String, CodingKey {
        case orderBy
        case limit
    }
}
