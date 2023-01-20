//
//  CountriesCollectionView.swift
//  ios_test_Natife
//
//  Created by Andrew Boldyrev on 19.01.2023.
//

import Foundation
import UIKit

class CountriesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var countriesLabel: UILabel!
    
    func configure() {
      //  countriesLabel.sizeToFit()
        countriesLabel.textColor = .white
        countriesLabel.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        countriesLabel.layer.masksToBounds = true
        countriesLabel.layer.cornerRadius = 5
    }
}
