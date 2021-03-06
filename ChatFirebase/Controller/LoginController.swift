//
//  LoginController.swift
//  ChatFirebase
//
//  Created by Nguyen Vinh on 1/19/19.
//  Copyright © 2019 Nguyen Vinh. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginController: BaseController {
    // MARK: - UI Property
    @IBOutlet weak var inputsContainerView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: - Property
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Config
    
    // MARK: - UI Action
    @IBAction func loginButtonClicked(_ sender: Any) {
        CFProgressManager.shared.show()
        
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            CFProgressManager.shared.dismiss()
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            CFProgressManager.shared.dismiss()

            if let error = error {
                print("Login error: \(error.localizedDescription)")
                return
            }
            
            self.routeToHomeController()
        }
    }
    
    @IBAction func registerButtonClicked(_ sender: Any) {
        let registerController = RegisterController.init(nibName: String(describing: RegisterController.self), bundle: nil)
        self.navigationController?.pushViewController(registerController, animated: true)
    }
    
    // MARK: - Handler
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
