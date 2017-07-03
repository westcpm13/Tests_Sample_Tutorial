//
//  File.swift
//  TestExample
//
//  Created by Pawel Trojan on 21.06.2017.
//  Copyright © 2017 ptrojan. All rights reserved.
//

import Foundation

class MovieManager {
    
    private var moviesToSeeArray = [Movie]()
    private var moviesSeenArray = [Movie]()
    
    var moviesToSeeCount: Int {
       return moviesToSeeArray.count
    }
    
    var moviesToSeenCount: Int {
       return moviesSeenArray.count
    }

    func addMovieToLibrary(movie: Movie) {
        self.moviesToSeeArray.append(movie)
    }
    
    func movieAtIndex(index: Int) -> Movie {
        return self.moviesToSeeArray[index]
    }
    
    func favouriteMovieAtIndex(index: Int) {
        guard self.moviesToSeeCount > index else { return }

        let favouritedMovie = self.moviesToSeeArray.remove(at: index)
        self.moviesSeenArray.append(favouritedMovie)
    }
    
    func favouritedMovieAtIndex(index: Int) -> Movie {
        return self.moviesSeenArray[index]
    }
}
