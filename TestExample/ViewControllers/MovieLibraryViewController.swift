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
    private let movieManager = MovieManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "MovieLibraryViewController"
        self.movieTableView.dataSource = movieLibraryDataService
        self.movieTableView.delegate = movieLibraryDataService
        self.movieLibraryDataService.movieManager = self.movieManager
        
        movieLibraryDataService.movieManager?.addMovieToLibrary(movie: Movie(title: "Hobbit", releaseDate: "02/2/2008"))
        movieLibraryDataService.movieManager?.addMovieToLibrary(movie: Movie(title: "Hobbit1", releaseDate: "02/12/2009"))
        movieLibraryDataService.movieManager?.addMovieToLibrary(movie: Movie(title: "Seksmicja", releaseDate: "30/04/1955"))
        movieLibraryDataService.movieManager?.addMovieToLibrary(movie: Movie(title: "God of War", releaseDate: "06/05/2015"))
        movieLibraryDataService.movieManager?.addMovieToLibrary(movie: Movie(title: "God of War", releaseDate: "13/08/2016"))
        movieLibraryDataService.movieManager?.addMovieToLibrary(movie: Movie(title: "God of War 3", releaseDate: "26/11/2017"))
        
        self.movieTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}


