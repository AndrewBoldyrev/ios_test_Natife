//
//  URL+Extension.swift
//  ios_test_Natife
//
//  Created by Andrew Boldyrev on 17.01.2023.
//

import Foundation

extension URL {
    init?(image path: String) {
        let baseUrl = "https://image.tmdb.org/t/p/w400/"
        self.init(string: "\(baseUrl)\(path)")
    }
}
