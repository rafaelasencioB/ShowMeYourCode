//
//  UserDetailRouter.swift
//  ShowMeYourCode
//
//  Created by rafael on 22/8/21.
//

import UIKit

class UserDetailRouter: UserDetailRouterProtocol {
    
    class func createUserDetailModule(for user: UserModel) -> UIViewController {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "UserDetailViewController")
        if let view = viewController as? UserDetailViewController {
            let presenter: UserDetailPresenterProtocol = UserDetailPresenter()
            let router: UserDetailRouterProtocol = UserDetailRouter()
            
            view.presenter = presenter
            
            presenter.view = view
            presenter.user = user
            presenter.router = router
            
            return viewController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
}
