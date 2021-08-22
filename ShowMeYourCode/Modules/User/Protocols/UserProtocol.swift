//
//  UserProtocol.swift
//  ShowMeYourCode
//
//  Created by rafael on 20/8/21.
//

import UIKit

protocol UserViewProtocol: AnyObject {
    var presenter: UserPresenterProtocol? { get set }
    
    func showUsers(_ users: [UserModel])
    func showError(with message: String)
    func showLoader()
    func dismissLoader()
}

protocol UserPresenterProtocol: AnyObject {
    var view: UserViewProtocol? { get set }
    var interactor: UserInteractorInputProtocol? { get set }
    var router: UserRouterProtocol? { get set }
    
    func viewDidLoad()
}

protocol UserRouterProtocol: AnyObject {
    static func createUserModule() -> UIViewController
}

protocol UserInteractorOutputProtocol: AnyObject {
    func didRetrieveUsers(_ users: [UserModel])
    func onError()
}

protocol UserInteractorInputProtocol: AnyObject {
    var presenter: UserInteractorOutputProtocol? { get set }
    var localDataManager: UserLocalDataManagerInputProtocol? { get set }
    var remoteDataMAnager: UserRemoteDataManagerInputProtocol? { get set }
    
    func retrieveUsers()
}

protocol UserRemoteDataManagerOutputProtocol: AnyObject {
    func onUsersRecieved(_ users: [UserModel])
    func onErrorRecieved(_ message: String?)
}

protocol UserRemoteDataManagerInputProtocol: AnyObject {
    var remoteRequestHandler: UserRemoteDataManagerOutputProtocol? { get set }
    func retrieveUsers()
}

protocol UserLocalDataManagerOutputProtocol: AnyObject {
    
}

protocol UserLocalDataManagerInputProtocol: AnyObject {
    func retrieveUsers() throws -> [UserModel]
}
