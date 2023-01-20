//
//  Networkeble.swift
//  ios_test_Natife
//
//  Created by Andrew Boldyrev on 20.01.2023.
//

import Foundation

protocol Networkable {
    static func requestAPI(api: EndPointType, completion: @escaping ((Data) -> Void))
    
    static func decode<T: Codable>(_ type: T.Type, data: Data) -> T?
}

extension Networkable {
    static func requestAPI(api: EndPointType, completion: @escaping ((Data) -> Void)) {
            guard let targetURL = api.url else { return }
            
            print("👉Request : \(targetURL)")
            
            URLSession(configuration: .default)
                .dataTask(with: targetURL) { (data, response, error) in
                    guard let data = data else {
                        //Do error handling in here
                        return
                    }
                    completion(data)
                }.resume()
        }
    
    static func decode<T: Codable>(type: T.Type, data: Data) -> T? {
        do{
            let response = try JSONDecoder().decode(type, from: data)
            return response
        } catch let error {
            print("##decodingError: \(error.localizedDescription)")
        }
        return nil
    }
}
