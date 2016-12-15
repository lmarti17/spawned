//
//  SignInViewController.swift
//  spawned
//
//  Created by MachuPichu on 13/12/2016.
//  Copyright © 2016 untstudio. All rights reserved.
//

import UIKit

class SignInViewController: UITableViewController {
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Variables method
    
    var response: Bool!
    
    

    // MARK: - Action method

    
    @IBAction func signIn(_ sender: Any) {
        
        
        if let login = loginTextField.text, let password = passwordTextField.text {
            
            if !login.isEmpty && !password.isEmpty {
                
                APIHandler.signIn(
                    name: login,
                    password: password,
                    success: { (response) in
                        
                        // register token in app
                        
                        UserDefaults.standard.setValue(response["user_token"].string, forKey: "user_token")
                        
                        self.performSegue(withIdentifier: ProfileViewController.segue_identifier, sender: nil)
                        
                    }, failure: { (error) in

                        let alert = UIAlertController(title: "Erreur", message: "Message", preferredStyle: UIAlertControllerStyle.alert)
                        alert.addAction(UIAlertAction(title: "", style: UIAlertActionStyle.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                )

            }
            
        }
    }
}

