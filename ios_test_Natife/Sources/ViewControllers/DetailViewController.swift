//
//  DetailViewController.swift
//  ios_test_Natife
//
//  Created by Andrew Boldyrev on 19.01.2023.
//

import Foundation
import UIKit
import Kingfisher
import AVFoundation

class DetailViewController : UIViewController {
    
    var movieViewModel = MovieViewModel.shared
    var selectedImage: UIImage?
    
    @IBOutlet weak var genresCollectionView: UICollectionView!
    @IBOutlet weak var coutriesCollectionView: UICollectionView!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieRatingLabel: UILabel!
    @IBOutlet weak var movieDescriptionLabel: UILabel!
    @IBOutlet weak var playTrailerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        prepareNetwork()
    }
    
    @IBAction func didTapPlayTrailerButton(_ sender: Any) {
        
        let sb = UIStoryboard(name: "VideoPlayer", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "PlayerViewController") as! PlayerViewController
        vc.modalPresentationStyle = .fullScreen
        
        present(vc, animated: false, completion: nil)
        
    }
    
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        
        let vc = storyboard?.instantiateViewController(identifier: "ImageViewController") as! ImageViewController
        vc.selectedImage = movieImage.image
        vc.modalPresentationStyle = .popover
        
        present(vc, animated: false, completion: nil)
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
        movieViewModel.fetchVideo {}
    }
        
        func setupUI() {
            
            if movieViewModel.video.isEmpty {
                playTrailerButton.isHidden = true
            }
            
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
