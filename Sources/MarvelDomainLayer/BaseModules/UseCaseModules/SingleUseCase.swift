//
//  SingleUseCase.swift
//  WeatherForecast 
//
//  Created by Erkut Bas on 24.10.2020.
//

import Foundation
import RxSwift
import NetworkEntityLayer

public class SingleUseCase<Request, Response, Repository>: BaseUseCase<Request, Single<Response>, Repository> {
    
    public func execute(useCaseCallBack: UseCaseCallBack<Response>, params: Request) {
        onPreExecute()
        addDisposable(disposable: self.generateUseCase(parameter: params)?.subscribe(onSuccess: { (response) in
            self.onPostExecute()
            useCaseCallBack.onSuccess(response: response)
        }, onFailure: { (error) in
            self.onPostExecute()
            self.onErrorCondition(useCaseCallBack: useCaseCallBack, error: error)
        }))
    }
    
    private func onErrorCondition(useCaseCallBack: UseCaseCallBack<Response>, error: Error) {
        guard let error = error as? ErrorResponse else { return }
        useCaseCallBack.onError(error: error)
    }
    
}
