//
//  LandingViewController.swift
//  spawned
//
//  Created by MachuPichu on 15/12/2016.
//  Copyright © 2016 untstudio. All rights reserved.
//

import UIKit

class LandingViewController: UIViewController {

    override func viewDidLoad() {
        self.isUserAlreadyLogged()
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    private func isUserAlreadyLogged(){
        
        print("check if already logged")
        let defaults = UserDefaults.standard
        
        let stat = defaults.string(forKey: "access_token")

        if  stat?.isEmpty != nil {
            
            self.performSegue(withIdentifier: "tabbarController_identifier", sender: nil)
        }
        
    }
}
