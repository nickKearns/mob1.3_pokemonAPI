//
//  NetworkManager.swift
//  PokeAPI
//
//  Created by Nicholas Kearns on 4/23/20.
//  Copyright © 2020 Nicholas Kearns. All rights reserved.
//

import Foundation



class NetworkManager {
    
    
    
    func fetchPokemon(givenUrl: String, _ completion: @escaping (APIResponse<Result>) -> Void) {
        
        
        
        let defaultSession = URLSession(configuration: .default)
        
        if let url = URL(string: givenUrl) {
            
            
            
            let request = URLRequest(url: url)
            
            let dataTask = defaultSession.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
                
                if let error = error {
                    return completion(APIResponse.failure(EndPointError.noData))
                }
                
                guard let data = data else {
                    return completion(APIResponse.failure(EndPointError.noData))
                }
                
                guard let result = try? JSONDecoder().decode(Result.self, from: data) else {
                    return completion(APIResponse.failure(EndPointError.couldNotParse))
                    
                }
                
                DispatchQueue.main.async {
                    completion(APIResponse.success(result))
                }
                
            })
            dataTask.resume()
            
            
            
        }
    }
    
    
    enum APIResponse<T> {
        case success(T)
        case failure(Error)
    }
    
    
    enum EndPointError: Error {
        case couldNotParse
        case noData
    }
    
}
