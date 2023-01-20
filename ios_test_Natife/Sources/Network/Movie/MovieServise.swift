//
//  MovieServise.swift
//  ios_test_Natife
//
//  Created by Andrew Boldyrev on 20.01.2023.
//

import Foundation

class MovieService: Networkable {

  static func loadMovies(page: Int, completion: @escaping ([Movie]) -> Void) {
    requestAPI(MovieAPI.movies(page: page)) { data in
      let decodedData = self.decode(APIResults.self, data: data)
      completion(decodedData?.movies ?? [])
    }
  }

  static func loadMovieGenres(movieId: Int, completion: @escaping ([Genres]) -> Void) {
    requestAPI(MovieAPI.movieGenres(movieId: movieId)) { (data) in
      let decodedData = self.decode(MovieDetailResults.self, data: data)
      completion(decodedData?.genres ?? [])
    }
  }

  static func loadVideo(movieId: Int, completion: @escaping ([VideoKey]) -> Void) {
    requestAPI(MovieAPI.video(movieId: movieId)) { (data) in
      let decodedData = self.decode(VideoResults.self, data: data)
      completion(decodedData?.results ?? [])
    }
  }
    
    static func loadMovieCountries(movieId: Int, completion: @escaping ([Coutries]) -> Void) {
      requestAPI(MovieAPI.movieCountries(movieId: movieId)) { (data) in
        let decodedData = self.decode(MovieDetailResults.self, data: data)
        completion(decodedData?.productionCountries ?? [])
      }
    }
    
    static func loadSearchMovie(movieName: String, completion: @escaping ([Movie]) -> Void) {
        requestAPI(MovieAPI.searchMovie(movieName: movieName)) { (data) in
        let decodedData = self.decode(APIResults.self, data: data)
        completion(decodedData?.movies ?? [])
      }
    }

    
}
