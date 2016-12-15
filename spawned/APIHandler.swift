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
    
    private static let baseUrl =  "https://spawner.herokuapp.com/"
    static let apiKey =  "DsYyhnvNwp7YSndP"
    
    static var mic: String!
    
    // MARK: - Routes API
    
    private enum Path: CustomStringConvertible {
        
        // post Sign UP
        case signUp
        
        // post Sign In
        case signIn
        
        // Get Profile data
        case profile
        
        // Get Profile games
        case profileGames
        
        // Get list of games
        case searchGames
        
        var description: String {
            switch self {
                case .signIn(): return "login"
                
                case .signUp(): return "register"
                
                case .profile(): return "me"
                
                case .profileGames(): return "me/games"
                
                default: return ""
                
            }
        }
        
    }
    
    
    
    ////////////////////////
    // MARK: - SIGNIN Event
    ////////////////////////
    
    static func signIn(name: String, password: String) {
        
        // Set url to reach
        let urlString = baseUrl + Path.signIn.description
        
        
        // Params
        let params = [
            "username": name,
            "password": password
        ]
        
        print("Parameters:\(params)")
        print("Url:\(urlString)")
        
        Alamofire.request(urlString, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil).validate().responseJSON { (response) in
            
            switch response.result {
            case .success(let value):
                let jsonData = JSON(value)
                print(jsonData)
                print("ÇA MARCHE")
                
                
            case .failure(let error):
                print(error.localizedDescription.description)
                print("ÇA MARCHE PAS")
                
//                let alert = UIAlertController(title: "Alert", message: "Message", preferredStyle: UIAlertControllerStyle.alert)
//                alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
//                self.present(alert, animated: true, completion: nil)
                
                return
                
                

            }
            
        }
        

    }
    
    
    
    
    
    
    ////////////////////////
    // MARK: - SIGNUP Event
    ////////////////////////
    
    static func signUp(param: [String: Any], success: @escaping ((JSON) -> Void), failure: @escaping ((String) -> Void)) {
    
        let url = baseUrl + Path.signUp.description
        
        print(url)
        
        print(param)
        let params = param
        
        Alamofire.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).validate().responseJSON { (response) in
            
            print(response.request)
            
            switch response.result {
            case .success(let value):
                let jsonData = JSON(value)
                success(jsonData)
                
                
            case .failure(let error):
                failure(error.localizedDescription.description)
            }
            
        }
        
    }
    
    
    
    
    
    /////////////////////////////
    // MARK: - Profile get Data
    /////////////////////////////
    
    
    static func getProfile(userToken: String) {
        
        var url = baseUrl + Path.profile.description
        
        
        let headers = [
            "Authorization": userToken
        ]
        
        
        // CALL TO GET PROFILE DATA
        Alamofire.request(url, headers: headers).validate().responseJSON {
            (response) in
            
            print(response.request)
            
            switch response.result {
            case .success(let value):
                let jsonData = JSON(value)
                print(jsonData)
                
                
            case .failure(let error):
                print(error)
                return
            }
            
        }
        
        // CALL TO GET PROFILE GAMES
        
        url = baseUrl + Path.profileGames.description
        
        Alamofire.request(url, headers: headers).validate().responseJSON {
            (response) in
            
            
            switch response.result {
            case .success(let value):
                let jsonData = JSON(value)
                print(jsonData)
                
                
            case .failure(let error):
                print(error)
                return
            }
            
            
        }
        
    }
    

}
