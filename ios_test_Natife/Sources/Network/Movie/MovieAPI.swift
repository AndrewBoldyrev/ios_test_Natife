//
//  MovieAPI.swift
//  ios_test_Natife
//
//  Created by Andrew Boldyrev on 17.01.2023.
//

import Foundation

enum MovieAPI {
    case movies(page: Int)
    case movieDetail(movieId: Int)
}

extension MovieAPI: EndPointType {
    
    static let apiKey = "66bff3316549637cd8fc1f1334753f88"
    
    var baseURL: String {
        return "https://api.themoviedb.org"
    }
    
    var path: String {
        switch self {
        case .movies :
            var str = "/3/movie/popular?"
            return str
        case .movieDetail(let movieId):
            return "/3/movie/\(movieId)?"
        }
    }
    
    var queryItems: [URLQueryItem] {
      var queryItems = [
        URLQueryItem(name: "api_key", value: MovieAPI.apiKey),
        URLQueryItem(name: "language", value: "en-US")
      ]
      switch self {
      case .movies(let page):
        queryItems.append(URLQueryItem(name: "page", value: String(page)))
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
    
//    var url: URL? {
//        var str = URL(string: "")
//        return str
//    }
}
