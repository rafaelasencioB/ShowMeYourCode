//
//  UserPresenter.swift
//  ShowMeYourCode
//
//  Created by rafael on 20/8/21.
//

import Foundation

class UserPresenter: UserPresenterProtocol {
    
    weak var view: UserViewProtocol?
    
    var interactor: UserInteractorInputProtocol?
    
    var router: UserRouterProtocol?
    
    func viewDidLoad() {
        view?.showLoader()
        interactor?.retrieveUsers()
    }
    
    
}
extension UserPresenter: UserInteractorOutputProtocol {
    func didRetrieveUsers(_ users: [UserModel]) {
        view?.showUsers(users)
        view?.dismissLoader()
    }
    
    func onError() {
        view?.showError(with: "Any Error")
        view?.dismissLoader()
    }
    
    
}
