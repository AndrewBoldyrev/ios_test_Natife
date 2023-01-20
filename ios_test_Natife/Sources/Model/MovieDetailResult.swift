//
//  MovieDetailResault.swift
//  ios_test_Natife
//
//  Created by Andrew Boldyrev on 17.01.2023.
//

import Foundation

struct MovieDetailResults: Codable {
    let genres : [Genres]
    let productionCountries : [Coutries]
    
    private enum CodingKeys: String, CodingKey {
        case genres,
             productionCountries = "production_countries" 
    }
}

struct Genres: Codable {
    let id: Int
    let name: String
}

struct Coutries : Codable {
    let iso: String
    let name: String
    
    private enum CodingKeys: String, CodingKey {
        case iso = "iso_3166_1",
             name
    }
}
