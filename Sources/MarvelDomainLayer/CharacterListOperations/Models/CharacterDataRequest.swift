//
//  CharacterListRequest.swift
//  
//
//  Created by Erkut Bas on 14.09.2021.
//

import Foundation

public struct CharacterDataRequest: Codable {
    
    private(set) public var characterId: Int?
    private(set) public var offset: Int = 0
    private(set) public var limit: Int = 30
    
    public init(characterId: Int? = nil, offset: Int = 0, limit: Int = 30) {
        self.characterId = characterId
        self.offset = offset
        self.limit = limit
    }
    
}
