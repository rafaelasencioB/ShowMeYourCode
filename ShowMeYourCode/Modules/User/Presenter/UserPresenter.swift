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
        view?.showUsers(users)
    }
    
    func onError() {
        
    }
    
    
}
