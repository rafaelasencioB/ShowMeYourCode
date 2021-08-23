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
    
    func presentUserDetail(with user: UserModel?) {
        guard let user = user, let view = self.view else { return }
        router?.presentUserDetailScreen(from: view, with: user)
    }
}
extension UserPresenter: UserInteractorOutputProtocol {
    func didRetrieveUsers(_ users: [UserModel]) {
        view?.dismissLoader()
        view?.showUsers(users)
    }
    
    func onError(_ message: String) {
        view?.dismissLoader()
        view?.showError(with: message)
    }
    
    
}
