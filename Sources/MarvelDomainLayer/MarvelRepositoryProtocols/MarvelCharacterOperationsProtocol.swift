//
//  MarvelCharacterOperationsProtocol.swift
//  
//
//  Created by Erkut Bas on 14.09.2021.
//

import Foundation
import RxSwift

public protocol MarvelCharacterOperationsProtocol {
    
    func getCharacterList(with request: CharacterDataRequest) -> Single<CharacterDataResponse>
    
    func getCharacterDetail(with request: CharacterDataRequest) -> Single<CharacterDataResponse>
    
    func getComicsData(with request: ComicsDataRequest) -> Single<ComicsDataResponse>
    
}
