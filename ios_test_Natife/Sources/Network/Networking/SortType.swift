//
//  SortType.swift
//  ios_test_Natife
//
//  Created by Andrew Boldyrev on 20.01.2023.
//

import Foundation

protocol SortTypeURL {
  var sort: String { get }
}

enum SortType {
    case releaseDate
    case voteCount
    case revenue
}

extension SortType : SortTypeURL  {

    var sort: String {
        switch self {
        case .releaseDate :
            return "release_date.desc"
        case .voteCount:
            return "vote_count.desc"
        case .revenue :
            return "revenue.desc"
        
        }
    }
    
}
