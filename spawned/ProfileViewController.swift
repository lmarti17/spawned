//
//  profileViewController.swift
//  spawned
//
//  Created by MachuPichu on 13/12/2016.
//  Copyright © 2016 untstudio. All rights reserved.
//

import UIKit
import Nuke

class ProfileViewController: UIViewController {
    
    static let segue_identifier = "profile_viewcontroller_identifier"
    
    // MARK: - OUTLETS
    
    
    @IBOutlet weak var userImg: UIImageView!
    
    @IBOutlet weak var gender: UILabel!
    
    
    @IBOutlet weak var microStatus: UILabel!

    @IBOutlet weak var age: UILabel!
    
    @IBOutlet weak var userName: UILabel!

    @IBOutlet weak var country: UILabel!
    
    @IBOutlet weak var userImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.getData()
        // Do any additional setup after loading the view.
    }
    
    
    private func getData() {
        
        
        let defaults =  UserDefaults.standard
        let userToken: String!
        userToken = defaults.string(forKey: "access_token")
        

        APIHandler.getProfile(
            userToken: userToken,
            success:{ (response) in
                
                self.gender.text = response["sex"].string
                self.microStatus.text = response["mic"].string
                self.country.text = response["country"].string
                self.userName.text = response["username"].string
                self.age.text = response["age"].string
                
                let userAvatar = response["avatar_thumb"].string
                Nuke.loadImage(with: URL(string: userAvatar!)!, into: self.userImage)
        
        }, failure:{ (error) in
            
            print(error)
        })
        
    }
    
}
