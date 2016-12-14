//
//  SignInViewController.swift
//  spawned
//
//  Created by MachuPichu on 13/12/2016.
//  Copyright © 2016 untstudio. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    
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
    


        // MARK: - Action method
    @IBAction func login(_ sender: Any) {
        
//
        
        if let login = loginTextField.text,
            let password = passwordTextField.text {
            
            if !login.isEmpty && !password.isEmpty {
                
                // CALL to the API
                let result = APIHandler.signIn(name: login, password: password)

                if !result.isEmpty {
                    self.performSegue(withIdentifier: SearchGameViewController.segue_identifier, sender: nil)
                }
               
            }
            
        }
        
        
        
    }
}

