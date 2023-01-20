//
//  MovieAPI.swift
//  ios_test_Natife
//
//  Created by Andrew Boldyrev on 17.01.2023.
//

import Foundation

enum MovieAPI {
    case movies(page: Int)
    case movieGenres(movieId: Int)
    case video(movieId: Int)
    case movieCountries(movieId: Int)
    case searchMovie(movieName: String)
}

extension MovieAPI: EndPointType {
    
    static let apiKey = "66bff3316549637cd8fc1f1334753f88"
    
    var baseURL: String {
        return "https://api.themoviedb.org"
    }
    
    var path: String {
        switch self {
        case .movies :
            return "/3/movie/popular?"
        case .movieGenres(let movieId):
            return "/3/movie/\(movieId)?"
        case .video(movieId: let movieId):
            return "/3/movie/\(movieId)/videos?"
        case .movieCountries(movieId: let movieId):
            return "/3/movie/\(movieId)?"
        case .searchMovie:
            return "/3/search/movie?"
        }
    }
    
    var queryItems: [URLQueryItem] {
      var queryItems = [
        URLQueryItem(name: "language", value: "en-US"),
        URLQueryItem(name: "api_key", value: MovieAPI.apiKey),
      ]
      switch self {
      case .movies(let page):
        queryItems.append(URLQueryItem(name: "page", value: String(page)))
        return queryItems
      case .searchMovie(let movieName):
          queryItems.append(URLQueryItem(name: "query", value: String(movieName)))
          return queryItems
      
      default:
        return queryItems
      }
    }
    
    var url: URL? {
      var urlComponents = URLComponents(string: baseURL + path)
      urlComponents?.queryItems?.append(contentsOf: queryItems)
      return urlComponents?.url
    }
}
