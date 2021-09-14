//
//  File.swift
//  
//
//  Created by Erkut Bas on 14.09.2021.
//

import Foundation
import RxSwift

final public class ComicsDataUseCase: SingleUseCase<ComicsDataRequest, ComicsDataResponse, MarvelCharacterOperationsProtocol> {
    
    override func generateUseCase(parameter: ComicsDataRequest) -> Single<ComicsDataResponse>? {
        return repository.getComicsData(with: parameter)
    }
    
}
