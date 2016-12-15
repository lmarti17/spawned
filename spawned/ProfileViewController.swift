//
//  profileViewController.swift
//  spawned
//
//  Created by MachuPichu on 13/12/2016.
//  Copyright © 2016 untstudio. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    static let segue_identifier = "profile_viewcontroller_identifier"
    
    // MARK: - OUTLETS
    
    
    @IBOutlet weak var userImg: UIImageView!
    
    @IBOutlet weak var gender: UILabel!
    
    @IBOutlet weak var Age: UILabel!
    
    @IBOutlet weak var microStatus: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()

        self.getData()
        // Do any additional setup after loading the view.
    }
    
    
    private func getData() {
        
        let userToken = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo2LCJleHAiOjE0ODQzNTY3Nzl9.2oZZCFeolHNuCQIyV1MZYzxUjuJ4GyrX-sfSeNuWXuI"

        APIHandler.getProfile(userToken: userToken)

        
    }
    
}
