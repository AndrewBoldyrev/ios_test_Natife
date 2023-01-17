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


}

