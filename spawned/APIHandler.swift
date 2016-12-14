//
//  APIHandler.swift
//  spawned
//
//  Created by MachuPichu on 12/12/2016.
//  Copyright © 2016 untstudio. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


struct APIHandler {
    
    // MARK: - Setting API
    
        private static let baseUrl =  "https://spawner.heroku-app.com/"
        private static let apiKey =  "DsYyhnvNwp7YSndP"
    
        static var mic: String!
    

    

    // MARK: - Routes API
    
    private enum Path: CustomStringConvertible {
        
        
        // post Sign UP
        case signUp()
        
        // post Sign In
        case signIn()
//        
//        // GET profile
//        case getProfile(id: Int)
//        
//        // Search game
//        case searchGame(query: String)
//
//        // Search user per game
//        case searchUserPerGame(id: Int)
        
        var description: String {
            
            switch self {
            case .signIn():
                    return "login"
                
                case .signUp():
                    return "register"

            }
        }
        
    }
    
    
    

    
    ////////////////////////
    // MARK: - SIGNIN Event
    ////////////////////////
    
    static func signIn(name: String, password: String) {
        
        // Set url to reach
        let urlString = "\(baseUrl)\(Path.signIn())"
        
        // Params
        let params: Parameters = [
            "name": name,
            "password": password
        ]
        
        print("Params: \(params)")
        print("URL requested: \(urlString)")
        
        
        // Request
        Alamofire.request(urlString, method: .post, parameters: params, encoding: JSONEncoding.default).responseJSON {response in
            
            print(response.response as Any) // HTTP URL response
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
            }
            
            return response
            
        }
    }
    
    
    
    
    
    ////////////////////////
    // MARK: - SIGNUP Event
    ////////////////////////
    
    static func signUp(username: String,
                       email: String,
                       password: String,
                       passwordConfirmation: String,
                       sex: String,
                       micStatus: Bool,
                       birthday: NSDate,
                       country: String) {
        
        let urlString = "\(baseUrl)\(Path.signIn())"
        
        
        // Check mic state
        if micStatus {
            self.mic = "yes"
        } else {
            self.mic = "no"
        }
        
        let params: Parameters = [
            "name": username,
            "email": email,
            "password": password,
            "password_confirmation": passwordConfirmation,
            "sex": sex,
            "mic": self.mic,
            "birthday": birthday,
            "country": country,
            "register_secret": apiKey
        ]
        
        // Launch POST request
        Alamofire.request(urlString, method: .post, parameters: params)
    }
    
    
}
