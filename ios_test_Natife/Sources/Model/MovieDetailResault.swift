//
//  MovieDetailResault.swift
//  ios_test_Natife
//
//  Created by Andrew Boldyrev on 17.01.2023.
//

import Foundation

struct MovieDetailResults: Codable {
    let genres : [Genres]
}

struct Genres: Codable {
    let id: Int
    let name: String
}
