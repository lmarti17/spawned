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
                        let defaults = UserDefaults.standard
                        defaults.set(response["access_token"].string, forKey: "access_token")
                        
                        print(defaults.string(forKey: "access_token"))
                        
                        // Switch to profile view
                        self.performSegue(withIdentifier: "tabbarController_identifier", sender: nil)
                        
                    }, failure: { (error) in

                        // Handle error
                        let alert = UIAlertController(title: "Error", message: "The login/password combination must be wrong", preferredStyle: UIAlertControllerStyle.alert)
                        alert.addAction(UIAlertAction(title: "Try again", style: UIAlertActionStyle.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                )

            } else {
                
                // Handle error
                let alert = UIAlertController(title: "Error", message: "All fields must be filled", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Try again", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            
        }
    }
}

