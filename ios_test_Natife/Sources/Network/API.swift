//
//  API.swift
//  ios_test_Natife
//
//  Created by Andrew Boldyrev on 17.01.2023.
//

import Foundation
import Alamofire

class API {
 
    static func loadSortMovies(_ sortType: String, completion: @escaping ([Movie]) -> Void) {
        let session = URLSession(configuration: .default)
        var urlComponents = URLComponents(string: "https://api.themoviedb.org/3/movie/popular?")!
        let apiQuery = URLQueryItem(name: "api_key", value: apiKey)
        let languageQuery = URLQueryItem(name: "language", value: "en-US")
        let sortType1 = URLQueryItem(name: "sort_by", value: sortType)
        
        urlComponents.queryItems?.append(sortType1)
        urlComponents.queryItems?.append(apiQuery)
        urlComponents.queryItems?.append(languageQuery)
        
        let requestURL = urlComponents.url!
        print(requestURL)
        let dataTask = session.dataTask(with: requestURL) { data, response, error in
            let successRange = 200..<300
            
            guard error == nil,
                  let statusCode = (response as? HTTPURLResponse)?.statusCode,
                  successRange.contains(statusCode) else {
                return
            }
            guard let resultData = data else {
                return
            }
//            let str = String(decoding: resultData, as: UTF8.self)
//           print("#######\(str.description)")
         //   print(requestURL)
            let movieSearch = API.decodeSortMovies(resultData)
            print("##LoadSortMovies success!")
            completion(movieSearch)
        }
        dataTask.resume()
    }
    
    static func decodeSortMovies(_ data: Data) -> [Movie] {
        do{
            let decoder = JSONDecoder()
            let response = try decoder.decode(APIResults.self, from: data)
            let movie = response.movies
            return movie
        } catch let error {
            print("##MovieLoad decodingError: \(error.localizedDescription)")
            return []
        }
    }
    
}
