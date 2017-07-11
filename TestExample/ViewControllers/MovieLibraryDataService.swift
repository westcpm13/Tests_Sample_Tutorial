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

//MARK: UITableViewDataSource
extension MovieLibraryDataService: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let movieManager = self.movieManager else {
            return 0
        }
        switch section {
        case 0:
            return movieManager.moviesToSeeCount
        case 1:
            return movieManager.moviesToSeenCount
        default:
            return 0
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell()
    }
}
//MARK: UITableViewDelegate
extension MovieLibraryDataService: UITableViewDelegate {
    
}
