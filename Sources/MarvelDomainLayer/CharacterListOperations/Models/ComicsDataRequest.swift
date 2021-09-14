//
//  File.swift
//  
//
//  Created by Erkut Bas on 14.09.2021.
//

import Foundation

public struct ComicsDataRequest: Codable {
    
    public var characterId: Int
    public var orderBy: String = "-onsaleDate"
    public var limit: Int = 10
    
    public init(characterId: Int, orderBy: String = "-onsaleDate", limit: Int = 10) {
        self.characterId = characterId
        self.orderBy = orderBy
        self.limit = limit
    }
    
    enum CodingKeys: String, CodingKey {
        case characterId
        case orderBy
        case limit
    }
}
