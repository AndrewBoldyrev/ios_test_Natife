//
//  UIMenu+SortMovies.swift
//  ios_test_Natife
//
//  Created by Andrew Boldyrev on 18.01.2023.
//

import Foundation
import UIKit


class SortMoviesMenu : UIMenu {
    
    var movieViewModel = MovieViewModel.shared
    var movieVC = MovieViewController()
    
    var menuItems: [UIAction] {
        return [
            UIAction(title: "Sort by relese date", image: nil, handler: { sortedMovie in
            }),
            UIAction(title: "Sort by revenue", image: nil, handler: { (_) in
            }),
            UIAction(title: "Sort by vote count", image: nil, handler: { (_) in
            })
        ]
    }

    var sortMovies: UIMenu {
        return UIMenu(title: "Sort Movies", image: nil, identifier: nil, options: [], children: menuItems)
    }
    
}
