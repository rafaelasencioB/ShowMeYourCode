//
//  UserDetailPresenter.swift
//  ShowMeYourCode
//
//  Created by rafael on 22/8/21.
//

import Foundation

class UserDetailPresenter: UserDetailPresenterProtocol {
    
    weak var view: UserDetailViewProtocol?
    
    var interactor: UserDetailInteractorProtocol?
    
    var router: UserDetailRouterProtocol?
    
    var user: UserModel?
    
    func viewDidLoad() {
        guard let user = self.user else { return }
        view?.showUserDetail(for: user)
    }
    
    
}
