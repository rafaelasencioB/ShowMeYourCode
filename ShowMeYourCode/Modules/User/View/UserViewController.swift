//
//  ViewController.swift
//  ShowMeYourCode
//
//  Created by rafael on 20/8/21.
//

import UIKit

class UserViewController: UIViewController {
    
    //MARK: Properties
    var presenter: UserPresenterProtocol?
    private static let reuseIdentifier = "UserViewControllerCell"
    
    private var users: [UserModel]? {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        return table
    }()
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        
        configureTable()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.frame
    }
    
    //MARK: Helpers
    private func configureTable() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
    }
}

//MARK: UserViewProtocol
extension UserViewController: UserViewProtocol {
    
    func showUsers(_ users: [UserModel]) {
        self.users = users
    }
    
    func showError(with message: String) {
        
    }
    
    func showLoader() {
        
    }
    
    func dismissLoader() {
        
    }
}

//MARK: UITableViewDelegate
extension UserViewController: UITableViewDelegate {
    
}

//MARK: UITableViewDataSource
extension UserViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserViewController.reuseIdentifier, for: indexPath)
        
        cell.textLabel?.text = self.users?[indexPath.row].username
        return cell
    }
}
