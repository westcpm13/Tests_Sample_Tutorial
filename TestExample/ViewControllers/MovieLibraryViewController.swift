//
//  ViewController.swift
//  TestExample
//
//  Created by ptrojan on 24.05.2017.
//  Copyright © 2017 ptrojan. All rights reserved.
//

import UIKit

class MovieLibraryViewController: UIViewController {

    @IBOutlet weak var movieTableView: UITableView!
    @IBOutlet var movieLibraryDataService: MovieLibraryDataService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "MovieLibraryViewController"
        self.movieTableView.dataSource = movieLibraryDataService
        self.movieTableView.delegate = movieLibraryDataService
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}


