//
//  APIRequestProtocol.swift
//  ShowMeYourCode
//
//  Created by rafael on 22/8/21.
//

import Foundation

public protocol APIRequestProtocol: Encodable {
    associatedtype Response: Codable
    
    var endPoint: String { get }
}
