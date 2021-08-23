//
//  NetworkError.swift
//  ShowMeYourCode
//
//  Created by rafael on 22/8/21.
//

import Foundation

enum NetworkError: Error {
    case unknownError
    case connectionError
    case invalidCredentials
    case invalidRequest
    case notFound
    case invalidResponse
    case serverError
    case serverUnavailable
    case timeOut
    
    static func checkErrorCode(_ errorCode: Int) -> NetworkError {
        switch errorCode {
        case 400:
            return .invalidRequest
        case 401:
            return .invalidCredentials
        case 404:
            return .notFound
        default:
            return .unknownError
        }
    }
}

extension NetworkError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .unknownError:
            return "unknownError"
        case .connectionError:
            return "connectionError"
        case .invalidCredentials:
            return "invalidCredentials"
        case .invalidRequest:
            return "invalidRequest"
        case .notFound:
            return "notFound"
        case .invalidResponse:
            return "invalidResponse"
        case .serverError:
            return "serverError"
        case .serverUnavailable:
            return "serverUnavailable"
        case .timeOut:
            return "timeOut"
        }
    }
}
