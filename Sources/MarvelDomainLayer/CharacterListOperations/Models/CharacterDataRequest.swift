//
//  CharacterListRequest.swift
//  
//
//  Created by Erkut Bas on 14.09.2021.
//

import Foundation

public struct CharacterDataRequest: Codable {
    
    private(set) public var characterId: Int?
    
    public init(characterId: Int? = nil) {
        self.characterId = characterId
    }
    
}
