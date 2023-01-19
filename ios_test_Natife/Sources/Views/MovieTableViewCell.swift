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
    
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var moviePosterImage: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieYearLabel: UILabel!
    @IBOutlet weak var movieRatingLabel: UILabel!
    @IBOutlet weak var movieGanresLabel: UILabel!
    
    var labels : [UILabel] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCellUI()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
      //  contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
    }
    
    func setupCellUI() {
        cellView.addShadow()
        cellView.layer.cornerRadius = 20
        
        movieTitleLabel.backgroundColor = UIColor.white.withAlphaComponent(0.7)
        movieYearLabel.backgroundColor = UIColor.white.withAlphaComponent(0.7)
        movieRatingLabel.backgroundColor = UIColor.white.withAlphaComponent(0.7)
        
        movieTitleLabel.sizeToFit()
        movieYearLabel.sizeToFit()
        movieRatingLabel.sizeToFit()
        
        movieTitleLabel.layer.masksToBounds = true
        movieTitleLabel.layer.cornerRadius = 5
        movieYearLabel.layer.masksToBounds = true
        movieYearLabel.layer.cornerRadius = 5
        movieRatingLabel.layer.masksToBounds = true
        movieRatingLabel.layer.cornerRadius = 5
    }
    
    func configure(_ item : Movie){
        movieTitleLabel.text = item.title
        movieRatingLabel.text = "Rating: \(item.rating)"
        let url = URL(image: item.backdrop)
        moviePosterImage.kf.setImage(with: url)
        moviePosterImage.layer.cornerRadius = 20
        moviePosterImage.contentMode = .scaleToFill
        let cropYear = String(item.releaseDate.dropLast(6))
        movieYearLabel.text = cropYear
        
    }
    
}
