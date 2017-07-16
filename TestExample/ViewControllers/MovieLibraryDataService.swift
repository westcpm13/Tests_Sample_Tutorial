//
//  MovieLibraryDataService.swift
//  TestExample
//
//  Created by Pawel Trojan on 10.07.2017.
//  Copyright © 2017 ptrojan. All rights reserved.
//

import UIKit

class MovieLibraryDataService: NSObject {
    var movieManager: MovieManager?
}

enum LibrarySection: Int {
    case moviesToSee
    case moviesSeen
}

//MARK: UITableViewDataSource
extension MovieLibraryDataService: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let movieManager = self.movieManager else {
            return 0
        }
        guard let librarySection = LibrarySection(rawValue: section) else { fatalError() }
        
        switch librarySection {
            case .moviesToSee:
                return movieManager.moviesToSeeCount
            case .moviesSeen:
                return movieManager.moviesToSeenCount
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        guard let movieManager = self.movieManager else { fatalError() }

        guard let librarySection = LibrarySection(rawValue: indexPath.section) else { fatalError() }
        
        let currentMovie = librarySection.rawValue == 0 ? movieManager.movieAtIndex(index: indexPath.row) : movieManager.favouritedMovieAtIndex(index: indexPath.row)
        
        cell.configureCell(withMovie: currentMovie)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let librarySection = LibrarySection(rawValue: section) else { fatalError() }
        
        var titleSection: String
        
        switch librarySection {
            case .moviesToSee:
            titleSection = "Movies To See"
            case .moviesSeen:
            titleSection = "Movies Seen"
        }
        
        return titleSection
    }
    
}
//MARK: UITableViewDelegate
extension MovieLibraryDataService: UITableViewDelegate {
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let movieManager = self.movieManager else { fatalError() }
        guard let librarySection = LibrarySection(rawValue: indexPath.section) else { fatalError() }
        
        if librarySection == .moviesToSee {
            movieManager.favouriteMovieAtIndex(index: indexPath.row)
            tableView.reloadData()
        }
    }
}
