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
    
    
    ////////////////////////
    // MARK: - Routes API
    ////////////////////////
    
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
                
                case .searchGames(): return "games"
                
                default: return ""
                
            }
        }
        
    }
    
    
    
    ////////////////////////
    // MARK: - SIGNIN Event
    ////////////////////////
    
    static func signIn(name: String, password: String, success: @escaping ((JSON) -> Void), failure: @escaping ((String) -> Void)) {
        
        // Set url to reach
        let urlString = baseUrl + Path.signIn.description
        
        
        // Params
        let params = [
            "username": name,
            "password": password
        ]
        
        
        Alamofire.request(urlString, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil).validate().responseJSON { (response) in
            
            switch response.result {
            case .success(let value):
                let jsonData = JSON(value)
                success(jsonData)
            case .failure(let error):
                failure(error.localizedDescription.description)

            }
            
        }
        

    }
    
    
    
    
    
    
    ////////////////////////
    // MARK: - SIGNUP Event
    ////////////////////////
    
    static func signUp(param: [String: Any], success: @escaping ((JSON) -> Void), failure: @escaping ((String) -> Void)) {
    
        let url = baseUrl + Path.signUp.description

        let params = param
        
        print(params)
        
        Alamofire.request(url, method: .post, parameters: params).validate().responseJSON {
            (reponse) in
            
            switch reponse.result {
                case .success(let value):
                
                let jsonData = JSON(value)
                    print(jsonData)
                    success(jsonData)
                
                case .failure(let error):
                    
                    print(error.localizedDescription.description)
                    failure(error.localizedDescription.description)
            }
        }
        
//        Alamofire.request(url, method: .post, parameters: params, encoding: JSONEncoding.default).validate().responseJSON {
//            (response) in
//            
//            switch response.result {
//            case .success(let value):
//
//                let jsonData = JSON(value)
//                print("JSONDATA: \(jsonData)")
//                
//                success(jsonData)
//                
//                
//                
//            case .failure(let error):
//                failure(error.localizedDescription.description)
//            }
//            
//        }
        
    }
    
    
    
    
    
    /////////////////////////////
    // MARK: - Profile get Data
    /////////////////////////////
    
    
    static func getProfile(userToken: String, success: @escaping ((JSON) -> Void), failure: @escaping ((String) -> Void)) {
        
        var url = baseUrl + Path.profile.description
        

//        let returnedData = JSON
        
        
        let headers = [
            "Authorization": userToken
        ]
        
        
        // CALL TO GET PROFILE DATA
        Alamofire.request(url, headers: headers).validate().responseJSON {
            (response) in
            
            switch response.result {
                case .success(let value):
                    let jsonData = JSON(value)

                    success(jsonData)
                
                case .failure(let error):
                    failure(error.localizedDescription.description)
            }
            
        }
        
        // CALL TO GET PROFILE GAMES
        
//        url = baseUrl + Path.profileGames.description
//        
//        Alamofire.request(url, headers: headers).validate().responseJSON {
//            (response) in
//            
//            
//            switch response.result {
//            case .success(let value):
//                let jsonData = JSON(value)
//                print(jsonData)
//                
//                
//            case .failure(let error):
//                print(error)
//                return
//            }
//            
//            
//        }
        
    }
    
    
    
    
    
    /////////////////////////////
    // MARK: - Get games
    /////////////////////////////
    
    static func searchGames(userToken: String,  success: @escaping ((JSON) -> Void), failure: @escaping ((String) -> Void)) {
        
        let url = baseUrl + Path.searchGames.description
        
        
        let headers = [
            "Authorization": userToken
        ]
        
        Alamofire.request(url, headers: headers).validate().responseJSON {
            (response) in
            
            
            switch response.result {
            case .success(let value):
                let jsonData = JSON(value)
                print(jsonData)
                success(jsonData)
                
                
            case .failure(let error):
                
                failure(error.localizedDescription.description)
        
            }
        }
    }
    

}
