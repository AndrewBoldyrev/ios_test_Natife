//
//  APIResault.swift
//  ios_test_Natife
//
//  Created by Andrew Boldyrev on 17.01.2023.
//

import Foundation

struct APIResults: Codable {
    let page: Int
    let numResults: Int
    let numPages: Int
    let movies: [Movie]
    
    private enum CodingKeys: String, CodingKey {
        case page, numResults = "total_results", numPages = "total_pages", movies = "results"
    }
}
