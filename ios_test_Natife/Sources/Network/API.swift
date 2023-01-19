//
//  API.swift
//  ios_test_Natife
//
//  Created by Andrew Boldyrev on 17.01.2023.
//

import Foundation
import Alamofire

class API {
    static let apiKey = MovieAPI.apiKey
    
    static func loadMovies(_ page: Int, completion: @escaping ([Movie]) -> Void) {
        let session = URLSession(configuration: .default)
        
        var str = ""
            str = "https://api.themoviedb.org/3/movie/popular?"
      
        var urlComponents = URLComponents(string: str)!
        let apiQuery = URLQueryItem(name: "api_key", value: apiKey)
        let languageQuery = URLQueryItem(name: "language", value: "en-US")
        let pageQuery = URLQueryItem(name: "page", value: "\(page)")
        urlComponents.queryItems?.append(apiQuery)
        urlComponents.queryItems?.append(languageQuery)
        urlComponents.queryItems?.append(pageQuery)
        
        let requestURL = urlComponents.url!
        
        let dataTask = session.dataTask(with: requestURL) { data, response, error in
            let successRange = 200..<300

            guard error == nil,
                  let statusCode = (response as? HTTPURLResponse)?.statusCode,
                  successRange.contains(statusCode) else {
                completion([])
                return
            }
            guard let resultData = data else {
                completion([])
                return
            }
            let movies = API.decodeMovie(resultData)
            print("##MovieLoad success!")
            completion(movies)
        }
        dataTask.resume()
    }
    
    static func decodeMovie(_ data: Data) -> [Movie] {
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
    
    static func loadMovieGenres(_ movieId: Int, completion: @escaping ([Genres]) -> Void) {
        let session = URLSession(configuration: .default)
        var urlComponents = URLComponents(string: "https://api.themoviedb.org/3/movie/\(movieId)?")!
        let apiQuery = URLQueryItem(name: "api_key", value: apiKey)
        let languageQuery = URLQueryItem(name: "language", value: "en-US")
        urlComponents.queryItems?.append(apiQuery)
        urlComponents.queryItems?.append(languageQuery)
        
        let requestURL = urlComponents.url!
        let dataTask = session.dataTask(with: requestURL) { data, response, error in
            let successRange = 200..<300
            
            guard error == nil,
                  let statusCode = (response as? HTTPURLResponse)?.statusCode,
                  successRange.contains(statusCode) else {
                completion([])
                return
            }
            guard let resultData = data else {
                 completion([])
                return
            }
            let movieDetail = API.decodeMovieGenres(resultData)
            print("##MovieDetail success!")
            completion(movieDetail)
        }
        dataTask.resume()
    }
    
    
    static func decodeMovieGenres(_ data: Data) -> [Genres] {
        do{
            let decoder = JSONDecoder()
            let response = try decoder.decode(MovieDetailResults.self, from: data)
            let genres = response.genres
            return genres
        } catch let error {
            print("##MovieDetail decodingError: \(error.localizedDescription)")
            return []
        }
        
    }
    
    
    static func loadMovieCountries(_ movieId: Int, completion: @escaping ([Coutries]) -> Void) {
        let session = URLSession(configuration: .default)
        var urlComponents = URLComponents(string: "https://api.themoviedb.org/3/movie/\(movieId)?")!
        let apiQuery = URLQueryItem(name: "api_key", value: apiKey)
        let languageQuery = URLQueryItem(name: "language", value: "en-US")
        urlComponents.queryItems?.append(apiQuery)
        urlComponents.queryItems?.append(languageQuery)
        
        let requestURL = urlComponents.url!
        let dataTask = session.dataTask(with: requestURL) { data, response, error in
            let successRange = 200..<300
            
            guard error == nil,
                  let statusCode = (response as? HTTPURLResponse)?.statusCode,
                  successRange.contains(statusCode) else {
                completion([])
                return
            }
            guard let resultData = data else {
                 completion([])
                return
            }
            let movieDetail = API.decodeMovieCountries(resultData)
            print("##MovieDetail success!")
            completion(movieDetail)
        }
        dataTask.resume()
    }
    
    
    static func decodeMovieCountries(_ data: Data) -> [Coutries] {
        do{
            let decoder = JSONDecoder()
            let response = try decoder.decode(MovieDetailResults.self, from: data)
            let countries = response.productionCountries
            return countries
        } catch let error {
            print("##MovieDetail decodingError: \(error.localizedDescription)")
            return []
        }
        
    }
    
    static func loadVideo(_ movieId: Int, completion: @escaping ([VideoKey]) -> Void) {
        let session = URLSession(configuration: .default)
        var urlComponents = URLComponents(string: "https://api.themoviedb.org/3/movie/\(movieId)/videos?")!
        let apiQuery = URLQueryItem(name: "api_key", value: apiKey)
        let languageQuery = URLQueryItem(name: "language", value: "en-US")
        urlComponents.queryItems?.append(apiQuery)
        urlComponents.queryItems?.append(languageQuery)
        
        let requestURL = urlComponents.url!
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
//            print("#######\(str.description)")
            let movieVideo = API.decodeVideo(resultData)
            print("##LoadVideo success!")
            completion(movieVideo)
        }
        dataTask.resume()
    }
    
    static func decodeVideo (_ data: Data) -> [VideoKey] {
        do{
            let decoder = JSONDecoder()
            let response = try decoder.decode(VideoResults.self, from: data)
            let videoKey = response.results
            
            return videoKey
        } catch let error {
            print("##LoadVideo decodingError: \(error.localizedDescription)")
            return []
        }
    }

    
}
