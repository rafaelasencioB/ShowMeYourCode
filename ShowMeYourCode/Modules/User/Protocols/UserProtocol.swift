//
//  UserProtocol.swift
//  ShowMeYourCode
//
//  Created by rafael on 20/8/21.
//

import UIKit

protocol UserViewProtocol {
    var presenter: UserPresenterProtocol? { get set }
    
    func showUsers(_ user: [UserModel])
    func showError(with message: String)
    func showLoader()
    func dismissLoader()
}

protocol UserPresenterProtocol {
    var view: UserViewProtocol? { get set }
    var interactor: UserInteractorInputProtocol? { get set }
    var router: UserRouterProtocol? { get set }
    
    func viewDidLoad()
}

protocol UserRouterProtocol {
    func createUserModule() -> UIViewController
}

protocol UserInteractorOutputProtocol {
    func didRetrieveUsers(_ users: [UserModel])
    func onError()
}

protocol UserInteractorInputProtocol {
    var presenter: UserInteractorOutputProtocol? { get set }
    var localDataManager: UserRemoteDataManagerInputProtocol? { get set }
    var remoteDataMAnager: UserLocalDataManagerInputProtocol? { get set }
    
    func retrieveUsers()
}

protocol UserRemoteDataManagerOutputProtocol {
    func onUsersRecieved(_ users: [UserModel])
    func onErrorRecieved(_ message: String?)
}

protocol UserRemoteDataManagerInputProtocol {
    var remoteRequestHandler: UserRemoteDataManagerOutputProtocol? { get set }
    func retrieveUsers(completion: @escaping (Result<[UserModel], Error>) -> Void)
}

protocol UserLocalDataManagerOutputProtocol {
    
}

protocol UserLocalDataManagerInputProtocol {
    var localRequestHandler: UserLocalDataManagerOutputProtocol? { get set }
    func retrieveUsers(completion: @escaping (Result<[UserModel], Error>) -> Void)
}
