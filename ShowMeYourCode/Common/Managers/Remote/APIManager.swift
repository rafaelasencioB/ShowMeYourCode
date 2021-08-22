//
//  APIManager.swift
//  ShowMeYourCode
//
//  Created by rafael on 22/8/21.
//

import Foundation

final class APIManager {
    
    private init() {}
    
    static let shared = APIManager()
    
    private let URL_DOMAIN: String = "jsonplaceholder.typicode.com"
    
    lazy var URL_BASE: String = {
        return "https://" + URL_DOMAIN + "/"
    }()
    
}
