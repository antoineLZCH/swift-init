//
//  ViewController.swift
//  SwiftIIM
//
//  Created by LOZACH Antoine on 18/11/2019.
//  Copyright © 2019 LOZACH Antoine. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loginAttempt(_ sender: UIButton) {
        let loginManager = FirebaseAuthManager()
        
        guard let email = EmailTextField.text, let password = PasswordTextField.text else {return}
        
        loginManager.signIn(email: email, password: password) { [weak self] (success) in
            guard let `self` = self else { return }
            
            if(success) {
                self.performSegue(withIdentifier: "HomePageViewController", sender: self)
            } else {
                let alertController = UIAlertController(title: "Error", message: "Unable to login", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
    
    
    @IBAction func registerPage(_ sender: UIButton) {
        self.performSegue(withIdentifier: "RegisterPageViewController", sender: self)
    }    
}
    
