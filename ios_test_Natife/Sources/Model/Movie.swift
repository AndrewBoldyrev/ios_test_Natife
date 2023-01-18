//
//  Movie.swift
//  ios_test_Natife
//
//  Created by Andrew Boldyrev on 17.01.2023.
//

import Foundation

struct Movie: Codable {
    let id: Int
    let posterPath: String
    var videoPath: String?
    let backdrop: String
    let title: String
    var releaseDate: String
    var rating: Double
    let overview: String
    
    private enum CodingKeys: String, CodingKey {
        case id,
             posterPath = "poster_path",
             videoPath,
             backdrop = "backdrop_path",
             title,
             releaseDate = "release_date",
             rating = "vote_average",
             overview
    }
}
