//
//  SignUpViewController.swift
//  spawned
//
//  Created by MachuPichu on 13/12/2016.
//  Copyright © 2016 untstudio. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    
    
    // MARK: - Form data
    
    
    @IBOutlet weak var nameTextField: UITextField!
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
        
        // CALL the API

    }

}
