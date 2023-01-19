//
//  DetailViewController.swift
//  ios_test_Natife
//
//  Created by Andrew Boldyrev on 19.01.2023.
//

import Foundation
import UIKit
import Kingfisher

class DetailViewController : UIViewController {
    
    var movieViewModel = MovieViewModel.shared
    
    @IBOutlet weak var genresCollectionView: UICollectionView!
    @IBOutlet weak var coutriesCollectionView: UICollectionView!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieRatingLabel: UILabel!
    @IBOutlet weak var movieDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       setupUI()
        prepareNetwork()
    }
    
    
    func prepareNetwork(){
        movieViewModel.genres = []
        movieViewModel.countries = []
        movieViewModel.fetchMovieGenres {
            self.genresCollectionView.reloadData()
        }
        movieViewModel.fetchMovieCountry {
            self.coutriesCollectionView.reloadData()
        }
    }
        
        func setupUI() {
            genresCollectionView.showsHorizontalScrollIndicator = false
            if let layout = genresCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                layout.scrollDirection = .horizontal
            }
            self.navigationController?.navigationBar.topItem?.title = " "
            self.navigationItem.title = movieViewModel.movies[movieViewModel.fetchMovieIndex()].title
            self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
            self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
          //  print(movieViewModel.movies.count)
            movieTitleLabel.text = self.navigationItem.title
            movieDescriptionLabel.text = movieViewModel.movies[movieViewModel.fetchMovieIndex()].overview
            movieImage.contentMode = .scaleToFill
            let imagePath = movieViewModel.movies[movieViewModel.fetchMovieIndex()].posterPath
            let url = URL(image: imagePath)
            movieImage.kf.setImage(with: url)
            
        }
        
}

extension DetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == self.genresCollectionView {
            return movieViewModel.genres.count
        } else {
           return  movieViewModel.countries.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.genresCollectionView {
            guard let genresCell = collectionView.dequeueReusableCell(withReuseIdentifier: "genresCell", for: indexPath) as? GenresCollectionViewCell else { return UICollectionViewCell() }
            genresCell.genresLabel.text = movieViewModel.genres[indexPath.row].name
            genresCell.configure()
            return genresCell
        } else {
            guard let countryCell = collectionView.dequeueReusableCell(withReuseIdentifier: "countryCell", for: indexPath) as? CountriesCollectionViewCell else { return UICollectionViewCell() }
            countryCell.countriesLabel.text = movieViewModel.countries[indexPath.row].name
            //  countryCell.configure()
            return countryCell
        }
    }
}

extension DetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 90, height: 48)
    }
}
