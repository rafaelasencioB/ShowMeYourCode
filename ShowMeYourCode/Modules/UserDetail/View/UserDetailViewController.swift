//
//  UserDetailViewController.swift
//  ShowMeYourCode
//
//  Created by rafael on 22/8/21.
//

import UIKit

class UserDetailViewController: UIViewController {

    //MARK: IBOulets
    @IBOutlet weak var lbUsername: UILabel!
    
    //MARK: Properties
    var presenter: UserDetailPresenterProtocol?
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
    }

}

//MARK: UserDetailViewProtocol
extension UserDetailViewController: UserDetailViewProtocol {
    
    func showUserDetail(for user: UserModel) {
        self.lbUsername.text = user.username
        print(user)
    }
}
