//
//  MovieTableViewCell.swift
//  ios_test_Natife
//
//  Created by Andrew Boldyrev on 17.01.2023.
//

import Foundation
import UIKit
import Kingfisher

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var moviePosterImage: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieYearLabel: UILabel!
    @IBOutlet weak var movieRatingLabel: UILabel!
    @IBOutlet weak var movieGanresLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(_ item : Movie){
        movieTitleLabel.text = item.title
        movieRatingLabel.text = "\(item.rating)"
        let url = URL(image: item.backdrop)
        moviePosterImage.kf.setImage(with: url)
        moviePosterImage.contentMode = .scaleToFill
        movieYearLabel.text = item.releaseDate
        
    }
    
}
