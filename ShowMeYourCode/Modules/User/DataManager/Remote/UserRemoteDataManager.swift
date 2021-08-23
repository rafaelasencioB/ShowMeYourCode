//
//  UserRemoteDataManager.swift
//  ShowMeYourCode
//
//  Created by rafael on 20/8/21.
//

import Foundation

class UserRemoteDataManager: UserRemoteDataManagerInputProtocol {
    var remoteRequestHandler: UserRemoteDataManagerOutputProtocol?
    
    let client = APIClient.shared
    
    func retrieveUsers() {
        client.send(request: GetUsers()) { [weak self] result in
            switch result {
            case let .success(users):
                print(users)
                self?.remoteRequestHandler?.onUsersRecieved(users)
            case let .failure(error):
                print(error)
                self?.remoteRequestHandler?.onErrorRecieved(error.localizedDescription)
            }
        }
    }
    
    
    
}

public struct GetUsers: APIRequestProtocol {
    
    public typealias Response = [UserModel]
    
    public var endPoint: String {
        return Endpoints.ENDPOINT_WS_USERS
    }
}

