//
//  MovieViewModel.swift
//  ios_test_Natife
//
//  Created by Andrew Boldyrev on 17.01.2023.
//

import Foundation

class MovieViewModel {
    
    static let shared = MovieViewModel()
    
    var movies: [Movie]
    
    var currentPage : Int = 0
    var selectedMovieIndex: Int = 0
    var genres: [Genres]
    var video : [VideoKey]
    var countries : [Coutries]
    var movieName : String = ""
    
    init() {
        self.movies = [Movie]()
        self.genres = [Genres]()
        self.countries = [Coutries]()
        self.video = [VideoKey]()
    }
    
    func incrementCurrentPage() -> Int {
        var number = currentPage
        number += 1
        return number
    }
    
    
    
    func fetchMovies(currentPage: Int, completionHandler: @escaping () -> Void) {
        MovieService.loadMovies(page: currentPage) { (movies) in
            DispatchQueue.main.async {
                self.movies += movies
                completionHandler()
            }
        }
    }
    
    func fetchMovieGenres(completionHandler: @escaping () -> Void) {
       
        MovieService.loadMovieGenres(movieId: movies[selectedMovieIndex].id) { genre in
            DispatchQueue.main.async {
                self.genres = genre
                //self.genres.append(contentsOf: genre)
                completionHandler()
            }
        }
    }
    
    func fetchMovieCountry(completionHandler: @escaping () -> Void) {
       
        MovieService.loadMovieCountries(movieId: movies[selectedMovieIndex].id) { country in
            DispatchQueue.main.async {
//                self.movie = movies
                self.countries = country
                print(String(country.count ))
                completionHandler()
            }
        }
    }
    
    func fetchVideo(completionHandler: @escaping () -> Void) {
        MovieService.loadVideo(movieId: movies[selectedMovieIndex].id) {
            video in
            DispatchQueue.main.async {
                self.video = video
              //  print(video.first?.key)
                completionHandler()
            }
        }
    }
    
    func fetchSearchMovies(movieName: String, completionHandler: @escaping () -> Void) {
        MovieService.loadSearchMovie(movieName: movieName) { (movies) in
            DispatchQueue.main.async {
                self.movies = movies
                completionHandler()
            }
        }
    }
    
    func fetchSortedMovies(sortType: String, completionHandler: @escaping () -> Void) {
        MovieService.loadSortMovies(sortType: sortType) { (movies) in
            DispatchQueue.main.async {
                self.movies = movies
                print(movies)
                completionHandler()
            }
        }
    }
    
    func updateMovieIndex(_ index: Int) -> Void {
        self.selectedMovieIndex = index
    }
    func fetchMovieIndex() -> Int {
        return self.selectedMovieIndex
    }
    
}
