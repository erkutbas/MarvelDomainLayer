//
//  UseCaseCallBackInteractor.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 24.10.2020.
//


import Foundation
import NetworkEntityLayer

public protocol UseCaseCallBackInterface {
    
    associatedtype Response
    
    var onSuccessCompletion: ((Response) -> Void)? { get }
    
    func onSuccess(response: Response)
    func onError(error: ErrorResponse)
    
    func onSuccess(completion: @escaping (Response) -> Void)
    func onError(completion: @escaping (ErrorResponse) -> Void)
    func commonResult(completion: @escaping (Result<Response, ErrorResponse>) -> Void)
    
}
