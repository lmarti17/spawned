//
//  SignUpViewController.swift
//  spawned
//
//  Created by MachuPichu on 13/12/2016.
//  Copyright © 2016 untstudio. All rights reserved.
//

import UIKit

class SignUpViewController: UITableViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var dateOfBirthTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var microBooleanValue: UISwitch!
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
    
    
//    func datePickerValueChanged(sender:UIDatePicker) {
//        
//        let dateFormatter = NSDate
//        
//        dateFormatter.dateStyle = CFDateFormatterStyle.MediumStyle
//        
//        dateFormatter.timeStyle = CFDateFormatterStyle.NoStyle
//        
//        dateOfBirthTextField.text = dateFormatter.stringFromDate(from: sender.date)
//        
//    }
    
    // MARK: - Set birthday Date Picker
    
//    @IBAction func birthdayTextField(_ sender: UITextField) {
//        
//        let datePickerView:UIDatePicker = UIDatePicker()
//        
//        datePickerView.datePickerMode = UIDatePickerMode.date
//        
//        sender.inputView = datePickerView
//        
//        datePickerView.addTarget(self, action: #selector(self.datePickerValueChanged), forControlEvents: UIControlEvents.ValueChanged)
//    }
    
    

    
    
    // MARK: - Sign Up

    @IBAction func signUp(_ sender: Any) {
        
        let password: String!
        let micStatus: String!
        
        if microBooleanValue.isOn {
            micStatus = "yes"
        } else {
            micStatus = "no"
        }
        
        
        if passwordTextField.text == verificationPasswordTextField.text {
            password = passwordTextField.text
        } else {
            
            // Handle error
            let alert = UIAlertController(title: "Error", message: "Passwords don't match", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Try again", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        
        // CALL the API
        
        if let userName = userNameTextField.text, let gender = genderTextField.text,
            let country = countryTextField.text ,let email = mailTextField.text, let birthday = dateOfBirthTextField.text {
            
            
            if !userName.isEmpty && !gender.isEmpty && !country.isEmpty && !password.isEmpty && !email.isEmpty && !micStatus.isEmpty && !birthday.isEmpty {
                
                
                let params = [
                    "username": userName,
                    "email": email,
                    "password": password!,
                    "password_confirmation": password!,
                    "sex": gender.lowercased(),
                    "mic": micStatus,
                    "birthday": birthday,
                    "country": country,
                    "register_secret": APIHandler.apiKey
                    ] as [String : Any]

                
                APIHandler.signUp(
                    param: params,
                    success: { (response) in
                        print(response)
                        
                        // register token in app
                        let defaults = UserDefaults.standard
                        defaults.set(response["access_token"].string, forKey: "access_token")
                        
                        self.performSegue(withIdentifier: "tabbarController_identifier", sender: nil)
                        
                }, failure: { (error) in
                    
                    print(error)
                    // Handle error
                    let alert = UIAlertController(title: "Error", message: "An error with the server has occured", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "Try again", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                })
            }
        }
    }
}
