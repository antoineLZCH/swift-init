//
//  RegisterPageController.swift
//  SwiftIIM
//
//  Created by LOZACH Antoine on 19/11/2019.
//  Copyright © 2019 LOZACH Antoine. All rights reserved.
//

import UIKit

class RegisterPageController: UIViewController  {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func attemptRegister(_ sender: UIButton) {
        let signUpManager = FirebaseAuthManager()
            if let email = emailTextField.text, let password = passwordTextField.text {
            signUpManager.createUser(email: email, password: password) {[weak self] (success) in
                guard let `self` = self else { return }
                var message: String = ""
                if (success) {
                    message = "User was sucessfully created."
                } else {
                    message = "There was an error."
                }
                let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func loginPage(_ sender: UIButton) {
        self.performSegue(withIdentifier: "EntryPageController", sender: self)
    }
    

}
