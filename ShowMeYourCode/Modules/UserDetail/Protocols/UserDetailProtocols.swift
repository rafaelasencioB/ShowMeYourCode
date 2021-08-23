//
//  UserDetailProtocols.swift
//  ShowMeYourCode
//
//  Created by rafael on 22/8/21.
//

import UIKit

protocol UserDetailViewProtocol: AnyObject {
    var presenter: UserDetailPresenterProtocol? { get set }
    
    func showUserDetail(for user: UserModel)
}

protocol UserDetailPresenterProtocol: AnyObject {
    var view: UserDetailViewProtocol? { get set }
    var interactor: UserDetailInteractorProtocol? { get set }
    var router: UserDetailRouterProtocol? { get set }
    var user: UserModel? { get set }
    
    func viewDidLoad()
}

protocol UserDetailRouterProtocol: AnyObject {
    static func createUserDetailModule(for user: UserModel) -> UIViewController
}

protocol UserDetailInteractorProtocol: AnyObject {
    
}
