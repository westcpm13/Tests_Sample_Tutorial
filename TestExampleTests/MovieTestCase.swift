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
        
}
