//
//  VideoResults.swift
//  ios_test_Natife
//
//  Created by Andrew Boldyrev on 19.01.2023.
//

import Foundation

struct VideoResults: Codable {
    let results: [VideoKey]
}

struct VideoKey: Codable {
    let key: String
    let id: String
}
