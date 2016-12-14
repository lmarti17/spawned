//
//  SignUpViewController.swift
//  spawned
//
//  Created by MachuPichu on 13/12/2016.
//  Copyright © 2016 untstudio. All rights reserved.
//

import UIKit

class SignUpViewController: UITableViewController {
    
    // MARK: - Form data
    
    
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var dateOfBirthTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var microBooleanValue: UISwitch!
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var verificationPasswordTextField: UITextField!

    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func signUp(_ sender: Any) {
        
        let password: String?
        let micStatus: Bool!
        
        if microBooleanValue.isOn {
            micStatus = true
        } else {
            micStatus = false
        }
        
        if passwordTextField.text == verificationPasswordTextField.text {
            password = passwordTextField.text
        } else {
            print("Erreur")
            return
        }
        
        // CALL the API
        
        if let userName = userNameTextField.text, let gender = genderTextField.text,
            let country = countryTextField.text ,let email = mailTextField.text {
            
            let params = [
                "username": userName,
                "email": email,
                "password": password!,
                "password_confirmation": password!,
                "sex": gender,
                "mic": micStatus,
                "birthday": "14/12/2016",
                "country": country,
                "register_secret": APIHandler.apiKey
                ] as [String : Any]
            
            APIHandler.signUp(
                param: params,
                success: { (response) in
                    print(response)
//                    self.performSegue(withIdentifier: "show_profile_identifer", sender: <#T##Any?#>)

                }, failure: { (error) in
                    print(error)
                }
            )
            
        } else {
            print("Error")
        }
        
        

    }

}
