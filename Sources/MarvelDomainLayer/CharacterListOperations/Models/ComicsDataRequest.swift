//
//  File.swift
//  
//
//  Created by Erkut Bas on 14.09.2021.
//

import Foundation

public struct ComicsDataRequest: Codable {
    
    public var characterId: Int
    public var dateRange: String
    public var orderBy: String = "-onsaleDate"
    public var limit: Int = 10
    public var format: String = "comic"
    
    public init(characterId: Int, dateRange: String, orderBy: String = "-onsaleDate", limit: Int = 10, format: String = "comic") {
        self.characterId = characterId
        self.dateRange = dateRange
        self.orderBy = orderBy
        self.limit = limit
        self.format = format
    }
    
    enum CodingKeys: String, CodingKey {
        case characterId
        case orderBy
        case limit
        case dateRange
        case format
    }
}
