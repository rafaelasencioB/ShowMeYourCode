//
//  UserPresenter.swift
//  ShowMeYourCode
//
//  Created by rafael on 20/8/21.
//

import Foundation

class UserPresenter: UserPresenterProtocol {
    
    var view: UserViewProtocol?
    
    var interactor: UserInteractorInputProtocol?
    
    var router: UserRouterProtocol?
    
    func viewDidLoad() {
        interactor?.retrieveUsers()
    }
    
    
}
extension UserPresenter: UserInteractorOutputProtocol {
    func didRetrieveUsers(_ users: [UserModel]) {
        print(users.count)
    }
    
    func onError() {
        
    }
    
    
}
