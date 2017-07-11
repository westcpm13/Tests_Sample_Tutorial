//
//  MovieLibraryDataServiceTests.swift
//  TestExample
//
//  Created by Pawel Trojan on 12.07.2017.
//  Copyright © 2017 ptrojan. All rights reserved.
//

import XCTest
@testable import TestExample

class MovieLibraryDataServiceTests: XCTestCase {
    
    var movieLibraryDataService: MovieLibraryDataService!
    var tableView: UITableView!
    
    override func setUp() {
        super.setUp()
        self.movieLibraryDataService = MovieLibraryDataService()
        self.movieLibraryDataService.movieManager = MovieManager()
        self.tableView = UITableView()
        tableView.dataSource = self.movieLibraryDataService
        tableView.delegate = self.movieLibraryDataService
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testTableViewSectionCount_ShouldBeTwo() {
        let numberOfSection = tableView.numberOfSections
        XCTAssertEqual(numberOfSection, 2)
    }
    
    func testRowCountInSectionOne_ShouldBeEqualMoviesToSeeCount() {
        self.movieLibraryDataService.movieManager?.addMovieToLibrary(movie: TestExample.Movie(title: "Movie1"))
        XCTAssertEqual(self.tableView.numberOfRows(inSection: 0), 1)
        
        self.movieLibraryDataService.movieManager?.addMovieToLibrary(movie: TestExample.Movie(title: "Movie2"))
        self.tableView.reloadData()
        
        XCTAssertEqual(self.tableView.numberOfRows(inSection: 0), 2)
    }
}
