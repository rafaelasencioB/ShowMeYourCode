//
//  UserInteractor.swift
//  ShowMeYourCode
//
//  Created by rafael on 20/8/21.
//

import Foundation

class UserInteractor: UserInteractorInputProtocol {
    
    var presenter: UserInteractorOutputProtocol?
    var localDataManager: UserLocalDataManagerInputProtocol?
    var remoteDataManager: UserRemoteDataManagerInputProtocol?
    
    func retrieveUsers() {
        remoteDataManager?.retrieveUsers()
    }
    
    
}

extension UserInteractor: UserRemoteDataManagerOutputProtocol {
    
    func onUsersRecieved(_ users: [UserModel]) {
        presenter?.didRetrieveUsers(users)
    }
    
    func onErrorRecieved(_ message: String?) {
        
    }
    
    
}
