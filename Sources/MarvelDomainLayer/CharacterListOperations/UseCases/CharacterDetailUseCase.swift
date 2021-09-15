//
//  File.swift
//  
//
//  Created by Erkut Bas on 15.09.2021.
//

import Foundation
import RxSwift

final public class CharacterDetailUseCase: SingleUseCase<CharacterDataRequest, CharacterDataResponse, MarvelCharacterOperationsProtocol> {
    
    override func generateUseCase(parameter: CharacterDataRequest) -> Single<CharacterDataResponse>? {
            
        return repository.getCharacterDetail(with: parameter)
        
    }
    
}
