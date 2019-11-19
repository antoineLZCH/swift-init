//
//  HomePageController.swift
//  SwiftIIM
//
//  Created by LOZACH Antoine on 18/11/2019.
//  Copyright © 2019 LOZACH Antoine. All rights reserved.
//

import UIKit
import Alamofire

class HomePageController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var lines = [String]()
    let apiURL: String = "https://api-ratp.pierre-grimaud.fr/v4/"
    
    @IBOutlet weak var navigationBar: UINavigationBar!
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lines = ["Ligne 1", "Ligne 2", "Ligne 3", "Ligne 3bis", "Ligne 4", "Ligne 5", "Ligne 6", "Ligne 7", "Ligne 7bis", "Ligne 8", "Ligne 9", "Ligne 10", "Ligne 11", "Ligne 12", "Ligne 13", "Ligne 14"]
        
        Alamofire.request(apiURL + "lines/metros/").responseString {
            response in
            if let res = response.result.value {
                print(res)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lines.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "line", for: indexPath)
        cell.textLabel?.text = lines[indexPath.row]
        return cell
    }
    
    @IBAction func attemptLogout(_ sender: UIButton) {
        let logOutManager = FirebaseAuthManager()
        logOutManager.logout()
        self.performSegue(withIdentifier: "LogOutAction", sender: self)
    }
    
    
}
