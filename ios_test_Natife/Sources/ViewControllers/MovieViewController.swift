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
    var activity = ActivityIndicator()
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        movieViewModel.fetchMovies(currentPage: movieViewModel.currentPage) {
            self.tableView.reloadData()
        }
        movieViewModel.currentPage = movieViewModel.incrementCurrentPage()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = self.tableView.indexPathForSelectedRow{
            movieViewModel.updateMovieIndex(indexPath.row)
        }
    }
    
    @IBAction func didTextSearchChange(_ sender: UITextField) {
        
        if let text = sender.text {
          //  self.movieViewModel.movies.removeAll()
            movieViewModel.fetchSearchMovies(movieName: text) {
                self.tableView.reloadData()
            }
            if text.isEmpty == true {
                movieViewModel.fetchMovies(currentPage: movieViewModel.currentPage) {
                    self.tableView.reloadData()
                }
            }
        }
        self.tableView.reloadData()
    }
    
    func setupUI() {
        
        searchTextField.addTarget(self, action: #selector(didTextSearchChange(_:)), for: .editingChanged)
        
        tableView.showsVerticalScrollIndicator = false
        
        searchTextField.leftView = UIView(frame: CGRect(x: 10, y: 0, width: 30, height: 40))
        searchTextField.leftViewMode = .unlessEditing
        let leftViewItSelf = UIImageView(frame: CGRect(x: 10, y: 10, width: 20, height: 20))
        leftViewItSelf.image = UIImage(named: "search")
        
        searchTextField.leftView?.addSubview(leftViewItSelf)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sort", image: nil, primaryAction: nil, menu: sort.sortMovies)
        
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
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
        
        if offsetY > (tableView.contentSize.height - 80 - scrollView.frame.size.height){
            movieViewModel.currentPage = movieViewModel.incrementCurrentPage()
            movieViewModel.fetchMovies(currentPage: movieViewModel.currentPage) {
                self.tableView.reloadData()
            }
        }
    }
}
