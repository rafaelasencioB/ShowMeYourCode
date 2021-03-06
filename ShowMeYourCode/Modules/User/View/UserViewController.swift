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
    
    private let refreshControl = UIRefreshControl()
    
    private var users: [UserModel]?
    
    private let lbErrorMessage: UILabel = {
        let label = UILabel()
        label.isHidden = true
        label.textAlignment = .center
        return label
    }()
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        return table
    }()
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
        
        configureUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.frame
        lbErrorMessage.frame = view.frame
    }
    
    //MARK: Helpers
    private func configureUI() {
        configureTable()
        view.addSubview(lbErrorMessage)
    }
    
    private func configureTable() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UserViewController.reuseIdentifier)
        tableView.tableFooterView = UIView()
        tableView.addSubview(refreshControl)
        refreshControl.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
    }
    
    //MARK: Selectors
    @objc
    private func handleRefresh() {
        presenter?.viewDidLoad()
    }
}

//MARK: UserViewProtocol
extension UserViewController: UserViewProtocol {
    
    func showUsers(_ users: [UserModel]) {
        self.users = users
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    func showError(with message: String) {
        self.users = nil
        DispatchQueue.main.async { [weak self] in
            self?.lbErrorMessage.isHidden = false
            self?.lbErrorMessage.text = message
        }
    }
    
    func showLoader() {
        DispatchQueue.main.async { [weak self] in
            self?.refreshControl.beginRefreshing()
        }
    }
    
    func dismissLoader() {
        DispatchQueue.main.async { [weak self] in
            self?.refreshControl.endRefreshing()
            self?.tableView.isHidden = self?.users == nil
            self?.lbErrorMessage.isHidden = self?.users != nil
        }
    }
}

//MARK: UITableViewDelegate
extension UserViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter?.presentUserDetail(with: self.users?[indexPath.row])
    }
}

//MARK: UITableViewDataSource
extension UserViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserViewController.reuseIdentifier, for: indexPath)
        
        cell.textLabel?.text = self.users?[indexPath.row].username
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}
