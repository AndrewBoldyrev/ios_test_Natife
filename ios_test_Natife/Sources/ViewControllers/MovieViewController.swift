//
//  ViewController.swift
//  ios_test_Natife
//
//  Created by Andrew Boldyrev on 16.01.2023.
//

import UIKit

class MovieViewController: UIViewController {

    var movieViewModel = MovieViewModel.shared
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        movieViewModel.fetchMovies {
            self.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = self.tableView.indexPathForSelectedRow{
            movieViewModel.updateMovieIndex(indexPath.row)
        }
    }

}

extension MovieViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieViewModel.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath) as? MovieTableViewCell else { return UITableViewCell() }
        cell.configure(movieViewModel.movies[indexPath.row])
        
        
        
     //   cell.configure(movieViewModel.movies[indexPath.row]) //passing data to the method.
        return cell
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.estimatedRowHeight
    }
    
    
}


