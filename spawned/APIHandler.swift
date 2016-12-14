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
        
        case profile(id: Int)
        
        var description: String {
            switch self {
                case .signIn(): return "login"
                case .signUp(): return "register"
                case .profile(let id): return "\(id)"
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
        
        Alamofire.request(urlString, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil).validate().responseJSON { (response) in
            
            switch response.result {
            case .success(let value):
                let jsonData = JSON(value)
                print(jsonData)
                
                
            case .failure(let error):
                print(error.localizedDescription.description)
            }
            
        }

    }
    
    ////////////////////////
    // MARK: - SIGNUP Event
    ////////////////////////
    
    static func signUp(param: [String: Any], success: @escaping ((JSON) -> Void), failure: @escaping ((String) -> Void)) {
    
        let url = baseUrl + Path.signUp.description
        let params = param
        
        Alamofire.request(url, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil).validate().responseJSON { (response) in
            
            switch response.result {
            case .success(let value):
                let jsonData = JSON(value)
                success(jsonData)
            case .failure(let error):
                failure(error.localizedDescription.description)
            }
            
        }
        
    }
    
}
