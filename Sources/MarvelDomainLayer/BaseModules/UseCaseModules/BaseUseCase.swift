//
//  BaseUseCase.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 24.10.2020.
//

import Foundation
import RxSwift

public class BaseUseCase<P, T, R>: BaseUseCaseInterface {
    
    private let disposeBag = DisposeBag()
    
    var repository: R
    
    typealias Parameters = P
    typealias Responses = T
    
    public init(repository: R) {
        self.repository = repository
    }
    
    func generateUseCase(parameter: P) -> T? {
        return nil
    }
    
    func addDisposable(disposable: Disposable?) {
        guard disposable != nil else {
            return
        }
        disposeBag.insert(disposable!)

    }
    
}
