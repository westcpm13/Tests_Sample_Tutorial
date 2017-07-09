//
//  MainViewControllerTests.swift
//  TestExample
//
//  Created by Pawel Trojan on 07.06.2017.
//  Copyright © 2017 ptrojan. All rights reserved.
//

import XCTest
@testable import TestExample

class MovieLibraryViewControllerTests: XCTestCase {
    
    var movieLibraryVC: MovieLibraryViewController!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.movieLibraryVC = storyboard.instantiateViewController(withIdentifier: "MovieLibraryViewController") as! MovieLibraryViewController
        _ = self.movieLibraryVC.view
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testMovieLibraryVCTitle() {
        XCTAssertEqual(self.movieLibraryVC.title, "MovieLibraryViewController")
    }
    
    func testMovieLibraryVC_TableViewShouldNotBeNil() {
        XCTAssertNotNil(self.movieLibraryVC.movieTableView)
    }
    
}
