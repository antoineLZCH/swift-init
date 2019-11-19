//
//  FirebaseAuthManager.swift
//  SwiftIIM
//
//  Created by LOZACH Antoine on 19/11/2019.
//  Copyright © 2019 LOZACH Antoine. All rights reserved.
//

import UIKit
import FirebaseAuth

class FirebaseAuthManager {
    func createUser(email: String, password: String, completionBlock: @escaping (_ success: Bool) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) {
            (authResult, error) in
            if let user = authResult?.user {
                print(user)
                completionBlock(true)
            } else {
                completionBlock(false)
            }
        }
    }
    
    func signIn(email: String, password: String, completionBlock: @escaping (_ success: Bool) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) {
            (result, error) in
            if let error = error, let _ = AuthErrorCode(rawValue: error._code) {
                completionBlock(false)
            } else {
                completionBlock(true)
            }
        }
    }
    
   func logout() {
           do{
            try Auth.auth().signOut()
             } catch let signOutError as NSError {
                print ("Error signing out: %@", signOutError)
             }
    }
}
