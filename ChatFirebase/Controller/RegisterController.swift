//
//  RegisterController.swift
//  ChatFirebase
//
//  Created by Nguyen Vinh on 1/19/19.
//  Copyright © 2019 Nguyen Vinh. All rights reserved.
//

import UIKit
import Firebase

class RegisterController: BaseController {
    // MARK: - UI Property
    @IBOutlet weak var inputsContainerView: UIView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: - Property
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initViews()
    }
    
    // MARK: - Config
    private func initViews() {
        inputsContainerView.layer.cornerRadius = 5
        inputsContainerView.layer.masksToBounds = true
    }
    
    // MARK: - UI Action
    @IBAction func registerButtonClicked(_ sender: Any) {
        guard let user = getUser() else {
            return
        }
        
        Auth.auth().createUser(withEmail: user.email, password: user.password) { (data, error) in
            if let error = error {
                print("Create user error: \(error.localizedDescription)")
                return
            }
            
            self.routeToHomeController()
        }
    }
    
    // MARK: - Handler
    func getUser() -> User? {
        guard let name = nameTextField.text, let email = emailTextField.text, let password = passwordTextField.text else {
            return nil
        }
        
        return User.init(name: name, email: email, password: password)
    }
    
    func routeToHomeController() {
        DispatchQueue.main.async { [weak self] in
            guard let `self` = self else {
                return
            }
            
            let homeController = HomeController.init(nibName: String(describing: HomeController.self), bundle: nil)
            self.navigationController?.pushViewController(homeController, animated: true)
        }
    }
    
    // MARK: - Override Function
    
    // MARK: - Notifications
    
    // MARK: - Utils

}
