//
//  ViewController.swift
//  ShowMeYourCode
//
//  Created by rafael on 20/8/21.
//

import UIKit

class UserViewController: UIViewController, UserViewProtocol {
    
    var presenter: UserPresenterProtocol?
    
    func showUsers(_ users: [UserModel]) {
        
    }
    
    func showError(with message: String) {
        
    }
    
    func showLoader() {
        
    }
    
    func dismissLoader() {
        
    }
    
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

