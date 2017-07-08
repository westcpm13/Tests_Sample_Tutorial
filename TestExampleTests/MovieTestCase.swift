//
//  MovieTestCase.swift
//  TestExample
//
//  Created by Pawel Trojan on 06.06.2017.
//  Copyright © 2017 ptrojan. All rights reserved.
//

import XCTest
@testable import TestExample


class MovieTestCase: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testInitSetMovieTitle() {
        let movie = Movie(title: "God War")
        XCTAssertEqual(movie.title, "God War")
    }
    
    func testInitSetMovieTitleAndReleasedDate() {
        let movie = Movie(title: "Lost World",releaseDate: "02/04/1985")
        XCTAssertEqual(movie.releaseDate, "02/04/1985")
    }
    
    func testMoviesAreEqual_ShouldReturnTrue() {
        let movie1 = Movie(title: "Tomb Rider")
        let movie2 = Movie(title: "Tomb Rider")
        XCTAssertEqual(movie1, movie2)
    }
    
    func testMoviesTitleAreDifferent_ShouldReturnNotEqual() {
        let movie1 = Movie(title: "Tomb Rider")
        let movie2 = Movie(title: "Seksmisja")
        XCTAssertNotEqual(movie1, movie2)
    }
    
    func testMoviesReleaseDatesAreDifferent_ShouldReturnNotEqual() {
        let movie1 = Movie(title: "Tomb Rider", releaseDate: "02/04/1995")
        let movie2 = Movie(title: "Tomb Rider", releaseDate: "12/06/1996")
        XCTAssertNotEqual(movie1, movie2)
    }
    
}
