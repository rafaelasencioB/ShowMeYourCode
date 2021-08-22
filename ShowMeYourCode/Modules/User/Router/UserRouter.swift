//
//  UserRouter.swift
//  ShowMeYourCode
//
//  Created by rafael on 20/8/21.
//

import UIKit

class UserRouter: UserRouterProtocol {
    
    class func createUserModule() -> UIViewController {
        let viewController = mainStoryboard.instantiateViewController(identifier: String(describing: UserViewController.self))
        
        if let view = viewController as? UserViewController {
            
            let presenter: UserPresenterProtocol
                & UserInteractorOutputProtocol = UserPresenter()
            
            let interactor: UserInteractorInputProtocol
                & UserRemoteDataManagerOutputProtocol = UserInteractor()
            
            let router: UserRouterProtocol = UserRouter()
            
            
            let localDataManager: UserLocalDataManagerInputProtocol = UserLocalDataManager()
            let remoteDataManager: UserRemoteDataManagerInputProtocol = UserRemoteDataManager()
            
            
            view.presenter = presenter
            
            presenter.interactor = interactor
            presenter.view = view
            presenter.router = router
            
            interactor.presenter = presenter
            interactor.localDataManager = localDataManager
            interactor.remoteDataMAnager = remoteDataManager
            
            remoteDataManager.remoteRequestHandler = interactor
            
            return view
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: K.Storyboards.Main, bundle: Bundle.main)
    }
}
