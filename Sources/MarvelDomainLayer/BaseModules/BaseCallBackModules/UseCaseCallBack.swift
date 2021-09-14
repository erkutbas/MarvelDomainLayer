//
//  UseCaseCallBack.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 24.10.2020.
//

import Foundation
import NetworkEntityLayer

public class UseCaseCallBack<T>: UseCaseCallBackInterface {
    public typealias Response = T
    
    public var onSuccessCompletion: ((T) -> Void)?
    var onErrorCompletion: ((ErrorResponse) -> Void)?
    var onCallBackResultCompletion: ((Result<T, ErrorResponse>) -> Void)?

    public func onSuccess(response: T) {
        onSuccessCompletion?(response)
        onCallBackResultCompletion?(.success(response))
    }
    
    public func onError(error: ErrorResponse) {
        onErrorCompletion?(error)
        onCallBackResultCompletion?(.failure(error))
    }
    
    public func onSuccess(completion: @escaping (T) -> Void) {
        onSuccessCompletion = completion
    }
    
    public func onError(completion: @escaping (ErrorResponse) -> Void) {
        onErrorCompletion = completion
    }
    
    public func commonResult(completion: @escaping (Result<T, ErrorResponse>) -> Void) {
        onCallBackResultCompletion = completion
    }
    
}
