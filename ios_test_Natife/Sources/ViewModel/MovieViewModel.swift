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
    var countries : [Coutries]
    
    init() {
        self.movies = [Movie]()
        self.genres = [Genres]()
        self.countries = [Coutries]()
    }
    
    func incrementCurrentPage() -> Int {
        var number = currentPage
        number += 1
        return number
    }
    
    
    
    func fetchMovies(completionHandler: @escaping () -> Void) {
        API.loadMovies(currentPage) { (movies) in
            DispatchQueue.main.async {
                self.movies += movies
                completionHandler()
            }
        }
    }
    
    func fetchMovieGenres(completionHandler: @escaping () -> Void) {
       
        API.loadMovieGenres(movies[selectedMovieIndex].id) { genre in
            DispatchQueue.main.async {
                self.genres = genre
                completionHandler()
            }
        }
    }
    
    func fetchMovieCountry(completionHandler: @escaping () -> Void) {
       
        API.loadMovieCountries(movies[selectedMovieIndex].id) { country in
            DispatchQueue.main.async {
//                self.movie = movies
                //self.genres.append(contentsOf: genre)
                self.countries = country
                print(String(country.count ))
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
