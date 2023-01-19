//
//  ViewController.swift
//  ios_test_Natife
//
//  Created by Andrew Boldyrev on 16.01.2023.
//

import UIKit

class MovieViewController: UIViewController {
    
    var movieViewModel = MovieViewModel.shared
    var sort = SortMoviesMenu()
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sort", image: nil, primaryAction: nil, menu: sort.sortMovies)
        
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        movieViewModel.fetchMovies {
            self.tableView.reloadData()
        }
        movieViewModel.currentPage = movieViewModel.incrementCurrentPage()
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
        
        return cell
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.estimatedRowHeight
    }
}

extension MovieViewController : UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offsetY = scrollView.contentOffset.y
        
        if offsetY > (tableView.contentSize.height - 100 - scrollView.frame.size.height){
            movieViewModel.currentPage = movieViewModel.incrementCurrentPage()
            movieViewModel.fetchMovies {
                self.tableView.reloadData()
            }
            print(movieViewModel.currentPage)
        }
    }
}
