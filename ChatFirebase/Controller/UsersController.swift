//
//  UsersController.swift
//  ChatFirebase
//
//  Created by Nguyen Vinh on 1/20/19.
//  Copyright © 2019 Nguyen Vinh. All rights reserved.
//

import UIKit

class UsersController: BaseController {
    // MARK: - UI Property
    @IBOutlet weak var usersTableView: UITableView!
    
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
        self.title = "Chat log"
    }
    
    private func setupTableView() {
        usersTableView.register(UINib.init(nibName: MessageCell.IDENTIFIER, bundle: nil), forCellReuseIdentifier: MessageCell.IDENTIFIER)
        
        usersTableView.tableFooterView = UIView()
        usersTableView.delegate = self
        usersTableView.dataSource = self
        usersTableView.rowHeight = 70
        usersTableView.separatorStyle = .none
        usersTableView.allowsSelection = false
    }
    // MARK: - UI Action
    
    // MARK: - Handler
    
    // MARK: - Override Function
    
    // MARK: - Notifications
    
    // MARK: - Utils

}

extension UsersController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MessageCell.IDENTIFIER, for: indexPath) as! MessageCell
        
        if indexPath.row % 2 == 0 {
            cell.messageLabel.text = "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."
            cell.handleUpdateLayoutMessage(isUserSend: false)
        } else {
            cell.messageLabel.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
            cell.handleUpdateLayoutMessage(isUserSend: true)
        }
        
        return cell
    }
}

extension UsersController: UITableViewDelegate {
    
}
