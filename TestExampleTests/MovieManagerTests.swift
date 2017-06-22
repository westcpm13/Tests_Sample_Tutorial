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
    
    func testMoviesCounts_BothShouldReturnZero() {
        XCTAssertEqual(sut.moviesToSeeCount, 0)
        XCTAssertEqual(sut.moviesToSeenCount, 0)
    }
}
