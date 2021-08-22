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
    var remoteDataMAnager: UserRemoteDataManagerInputProtocol?
    
    func retrieveUsers() {
        
    }
    
    
}

extension UserInteractor: UserRemoteDataManagerOutputProtocol {
    
    func onUsersRecieved(_ users: [UserModel]) {
        
    }
    
    func onErrorRecieved(_ message: String?) {
        
    }
    
    
}
