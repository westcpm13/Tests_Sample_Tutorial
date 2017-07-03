//
//  MovieManagerTests.swift
//  TestExample
//
//  Created by Pawel Trojan on 21.06.2017.
//  Copyright © 2017 ptrojan. All rights reserved.
//

import XCTest
@testable import TestExample

class MovieManagerTests: XCTestCase {
    
    var sut: MovieManager!

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.sut = MovieManager()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testMoviesToSeeCount_ReturnsZero() {
        XCTAssertEqual(sut.moviesToSeeCount, 0)
    }
    
    func testMoviesToSeenCount_ReturnZero() {
        XCTAssertEqual(sut.moviesToSeenCount, 0)
    }
    
    func testMoviesToSeeCount_ShouldBeOneAfterMovieAdded() {
        sut.addMovieToLibrary(movie: TestExample.Movie(title: "Hobbit"))
        XCTAssertEqual(sut.moviesToSeeCount, 1)
    }
    
    func testMovieAtIndex_ReturnLastAddedMoview() {
        let movie = TestExample.Movie(title: "Seksmisja")
        sut.addMovieToLibrary(movie: movie)
        let returnedMovieAtIndex = sut.movieAtIndex(index: 0)
        XCTAssertEqual(movie.title, returnedMovieAtIndex.title)
    }
    
    func testFavouriteMovies_UpdatesMoviesSeenAndMoviesToSeeCount() {
        let movie = TestExample.Movie(title: "Oszukac przeznaczenie")
        self.sut.addMovieToLibrary(movie: movie)
        self.sut.favouriteMovieAtIndex(index: 0)
        XCTAssertEqual(self.sut.moviesToSeeCount, 0)
        XCTAssertEqual(self.sut.moviesToSeenCount, 1)

    }
    
    func testFavouriteMovie_ShouldRemoveMovieFromMoviesToSeeArray() {
        let movie1 = TestExample.Movie(title: "Film Pierwszy")
        let movie2 = TestExample.Movie(title: "Film Drugi")
        
        self.sut.addMovieToLibrary(movie: movie1)
        self.sut.addMovieToLibrary(movie: movie2)
        // movie1 is at index 0
        self.sut.favouriteMovieAtIndex(index: 0)
        
        XCTAssertEqual(self.sut.movieAtIndex(index: 0).title, movie2.title)
    }
    
    func testFavouriteMovieAtIndex_ShouldReturnFavouriteMovie() {
        let movie = TestExample.Movie(title: "moj ulobiony film")
        self.sut.addMovieToLibrary(movie: movie)
        self.sut.favouriteMovieAtIndex(index: 0)
       
        let returnedMovie = self.sut.favouritedMovieAtIndex(index: 0)
        
        XCTAssertEqual(movie.title, returnedMovie.title)
        
    }
    
}
