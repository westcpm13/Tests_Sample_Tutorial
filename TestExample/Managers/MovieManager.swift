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
    
    lazy var moviesToSeeCountHowLazy: Int = {
        return self.moviesToSeeArray.count
    }()
    
    var moviesToSeeCount: Int {
       return moviesToSeeArray.count
    }
    
    var moviesToSeenCount: Int {
       return moviesSeenArray.count
    }

    func addMovieToLibrary(movie: Movie) {
        if !moviesToSeeArray.contains(movie) {
            moviesToSeeArray.append(movie)
        }
    }
    
    func movieAtIndex(index: Int) -> Movie {
        return self.moviesToSeeArray[index]
    }
    
    func favouriteMovieAtIndex(index: Int) {
        guard index < moviesToSeeCount else {return}
        
        let favoritedMovie = moviesToSeeArray.remove(at: index)
        moviesSeenArray.append(favoritedMovie)
    }
    
    func favouritedMovieAtIndex(index: Int) -> Movie {
        return self.moviesSeenArray[index]
    }
    
    func clearArrays() {
        self.moviesSeenArray.removeAll()
        self.moviesToSeeArray.removeAll()
    }
    
}
