//
//  File.swift
//  
//
//  Created by Erkut Bas on 16.09.2021.
//

import Foundation

public protocol UseCaseListener: AnyObject {
    
    func onPreExecute()
    
    func onPostExecute()
    
}
