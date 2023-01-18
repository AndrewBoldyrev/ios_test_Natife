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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCellUI()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
    
    func setupCellUI() {
        cellView.addShadow()
        cellView.layer.cornerRadius = 20
    }
    
    func configure(_ item : Movie){
        movieTitleLabel.text = item.title
        movieRatingLabel.text = "\(item.rating)"
        let url = URL(image: item.backdrop)
        moviePosterImage.kf.setImage(with: url)
        moviePosterImage.layer.cornerRadius = 20
        moviePosterImage.contentMode = .scaleToFill
        movieYearLabel.text = item.releaseDate
        
    }
    
}
