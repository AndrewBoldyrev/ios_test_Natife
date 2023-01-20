//
//  Networkeble.swift
//  ios_test_Natife
//
//  Created by Andrew Boldyrev on 20.01.2023.
//

import Foundation
import Alamofire

protocol Networkable {
    static func requestAPI(api: EndPointType, completion: @escaping ((Data) -> Void))
    
    static func decode<T: Codable>(type: T.Type, data: Data) -> T?
}

extension Networkable {
    static func requestAPI(api: EndPointType, completion: @escaping ((Data) -> Void)) {
        guard let targetURL = api.url else { return }
        
        print("👉Request : \(targetURL)")
        
        AF.request(targetURL ,method: .get, parameters: [:],headers: nil).validate().responseData { responseData in
            switch responseData.result {
            case .success(let value):
                completion(value)
            case .failure(let error):
                print(error.localizedDescription)
              //  completion(nil)
            }
        }
    }
    
    static func decode<T: Codable>(type: T.Type, data: Data) -> T? {
        do{
            let response = try JSONDecoder().decode(type, from: data)
            return response
        } catch let error {
            print("🛑decodingError: \(error.localizedDescription)")
        }
        return nil
    }
}
