//
//  HomeController.swift
//  ChatFirebase
//
//  Created by Nguyen Vinh on 1/19/19.
//  Copyright © 2019 Nguyen Vinh. All rights reserved.
//

import UIKit
import Firebase

class HomeController: BaseController {
    // MARK: - UI Property
    @IBOutlet weak var homeTableView: UITableView!
    
    // MARK: - Property
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initViews()
    }
    
    // MARK: - Config
    private func initViews() {
        setupNav()
        setupTableView()
    }
    
    private func setupNav() {
        self.title = "Home"
        
        let logOutButton = UIBarButtonItem.init(title: "LogOut", style: .plain, target: self, action: #selector(handleLogOut))
        self.navigationItem.leftBarButtonItem = logOutButton
        
        let newMessageButton = UIBarButtonItem.init(image: #imageLiteral(resourceName: "new_message_icon"), style: .plain, target: self, action: #selector(handleWriteNewMessage))
        self.navigationItem.rightBarButtonItem = newMessageButton
    }
    
    private func setupTableView() {
        homeTableView.register(UINib.init(nibName: HomeCell.IDENTIFIER, bundle: nil), forCellReuseIdentifier: HomeCell.IDENTIFIER)
        
        homeTableView.tableFooterView = UIView()
        homeTableView.delegate = self
        homeTableView.dataSource = self
        homeTableView.rowHeight = 70
        homeTableView.alwaysBounceVertical = true
    }
    
    // MARK: - UI Action
    @objc func handleLogOut(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
            
            let loginController = LoginController.init(nibName: String(describing: LoginController.self), bundle: nil)
            let navController = UINavigationController(rootViewController: loginController)
            UIApplication.shared.keyWindow?.rootViewController = navController
        } catch let error {
            print("Log out fail: \(error.localizedDescription)")
        }
    }
    
    @objc func handleWriteNewMessage(_ sender: UIBarButtonItem) {
        let messageController = MessagesController.init(nibName: String(describing: MessagesController.self), bundle: nil)
        navigationController?.pushViewController(messageController, animated: true)
    }
    
    // MARK: - Handler
    
    // MARK: - Override Function
    
    // MARK: - Notifications
    
    // MARK: - Utils
}

extension HomeController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeCell.IDENTIFIER, for: indexPath) as! HomeCell
        
        return cell
    }
}

extension HomeController: UITableViewDelegate {
    
}
