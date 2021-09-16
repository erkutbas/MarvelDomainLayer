//
//  BaseUseCaseInterface.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 24.10.2020.
//

import Foundation

protocol BaseUseCaseInterface {
    
    var useCaseListener: UseCaseListener? { get }
    
    associatedtype Parameters
    associatedtype Responses
    
    func generateUseCase(parameter: Parameters) -> Responses?
    
    func onPreExecute()
    func onPostExecute()
    
}
