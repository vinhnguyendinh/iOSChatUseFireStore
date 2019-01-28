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
        CFProgressManager.shared.show()
        
        guard let name = nameTextField.text, let email = emailTextField.text, let password = passwordTextField.text else {
            CFProgressManager.shared.dismiss()
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] (data, error) in
            CFProgressManager.shared.dismiss()
            
            guard let `self` = self else { return }
            if let error = error {
                print("Create user error: \(error.localizedDescription)")
                return
            }
            
            let user = User.init(id: UUID().uuidString, name: name, email: email, password: password)
            self.addUserInforToFirestore(user: user)
            
            self.routeToHomeController()
        }
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
    
    func addUserInforToFirestore(user: User) {
        let db = Firestore.firestore()
        
        var ref: DocumentReference? = nil
        ref = db.collection(CFConstants.CollectionNames.users).addDocument(data: user.toJson(), completion: { (error) in
            if let error = error {
                print("Error create user to database: \(error.localizedDescription)")
                return
            }
            
            print("Successfully with id: \(ref!.documentID)")
        })
    }
    
    // MARK: - Override Function
    
    // MARK: - Notifications
    
    // MARK: - Utils

}
