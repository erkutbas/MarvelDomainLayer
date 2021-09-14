//
//  CharactersDataUseCase.swift
//  
//
//  Created by Erkut Bas on 14.09.2021.
//

import Foundation
import RxSwift

public final class CharactersDataUseCase: SingleUseCase<CharacterDataRequest, CharacterDataResponse, MarvelCharacterOperationsProtocol> {
    
    override func generateUseCase(parameter: CharacterDataRequest) -> Single<CharacterDataResponse>? {
        return repository.getCharacterList(with: parameter)
    }
    
}
