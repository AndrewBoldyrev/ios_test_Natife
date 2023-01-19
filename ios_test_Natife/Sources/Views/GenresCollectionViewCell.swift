//
//  GenresCollectionViewCell.swift
//  ios_test_Natife
//
//  Created by Andrew Boldyrev on 19.01.2023.
//

import Foundation
import UIKit

class GenresCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var genresLabel: UILabel!
    
    
    func configure() {
      //  genresLabel.sizeToFit()
        genresLabel.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        genresLabel.layer.masksToBounds = true
        genresLabel.layer.cornerRadius = 5
    }
}
