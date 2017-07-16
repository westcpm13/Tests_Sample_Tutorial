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
    var movieLibraryViewController: MovieLibraryViewController!
    var tableView: UITableView!
    
    override func setUp() {
        super.setUp()
        self.movieLibraryDataService = MovieLibraryDataService()
        self.movieLibraryDataService.movieManager = MovieManager()
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        self.movieLibraryViewController = storyBoard.instantiateViewController(withIdentifier: "MovieLibraryViewController") as! MovieLibraryViewController
        _ = self.movieLibraryViewController.view
        
        
        self.tableView = self.movieLibraryViewController.movieTableView
        self.tableView.register(MovieCell.self, forCellReuseIdentifier: "MovieCell")
        tableView.dataSource = self.movieLibraryDataService
        tableView.delegate = self.movieLibraryDataService
    }
    
    override func tearDown() {
        super.tearDown()
        self.tableView = nil
        self.movieLibraryViewController = nil
        self.movieLibraryDataService = nil
    }
    
    func testTableViewSectionCount_ShouldBeTwo() {
        let numberOfSection = tableView.numberOfSections
        XCTAssertEqual(numberOfSection, 2)
    }
    
    func testRowCountInSectionOne_ShouldBeEqualMoviesToSeeCount() {
        XCTAssertEqual(self.tableView.numberOfRows(inSection: 0), 6)
    }
    
    func testRowCountInSectionTwo_ShouldBeEqualMoviesSeenCount() {
        XCTAssertEqual(self.tableView.numberOfRows(inSection: 1), 0)
    }
    
    
    func testCellForIndexPath_ShouldReturnMovieCell() {
        self.movieLibraryDataService.movieManager?.addMovieToLibrary(movie: TestExample.Movie(title: "Movie1"))
        self.tableView.reloadData()
        let cell = self.tableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(cell is MovieCell)
    }
    
    func testCell_ShoudDequeueCell() {
        let tableViewMock = TableViewMock.initializeTableViewMock()
        tableViewMock.dataSource = self.movieLibraryDataService
        self.movieLibraryDataService.movieManager?.addMovieToLibrary(movie: TestExample.Movie(title: "Movie1"))
        tableViewMock.reloadData()
        _ = tableViewMock.cellForRow(at: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(tableViewMock.cellDequeueProperthy)
    }
    
    func testSetInitializeCell() {
        let tableViewMock = TableViewMock.initializeTableViewMock()
        tableViewMock.dataSource = self.movieLibraryDataService
        
        let movie = TestExample.Movie(title: "Hobbit")
        self.movieLibraryDataService.movieManager?.addMovieToLibrary(movie: movie)
        tableViewMock.reloadData()
        
        let cell = tableViewMock.cellForRow(at: IndexPath(row: 0, section: 0)) as! MovieCellMock
        XCTAssertEqual(cell.movie, movie)
        
    }
    
    func testSectionTwoCellConfig_ShouldSetCellWithFavouritedMovie() {
        let tableViewMock = TableViewMock.initializeTableViewMock()
        tableViewMock.dataSource = self.movieLibraryDataService

        let movie1 = TestExample.Movie(title: "Action")
        let movie2 = TestExample.Movie(title: "Thriller")
        
        self.movieLibraryDataService.movieManager?.addMovieToLibrary(movie: movie1)
        self.movieLibraryDataService.movieManager?.addMovieToLibrary(movie: movie2)
        self.movieLibraryDataService.movieManager?.favouriteMovieAtIndex(index: 0)
        tableViewMock.reloadData()
        
        let cell = tableViewMock.cellForRow(at: IndexPath(row: 0, section: 1)) as! MovieCellMock
        
        XCTAssertEqual(cell.movie, movie1)

    }
    
    func testFavouritingAMovie_ShouldFavouriteMovieOnCellSelect() {
        self.movieLibraryDataService.movieManager?.addMovieToLibrary(movie: TestExample.Movie(title: "Hobbit1"))
        self.movieLibraryDataService.movieManager?.addMovieToLibrary(movie: TestExample.Movie(title: "Hobbit2"))
        self.tableView.reloadData()
        
        self.tableView.delegate?.tableView!(self.tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        
        XCTAssertEqual(self.movieLibraryDataService.movieManager?.moviesToSeeCount, 1)
        XCTAssertEqual(self.movieLibraryDataService.movieManager?.moviesToSeenCount, 1)
        XCTAssertEqual(self.tableView.numberOfRows(inSection: 0), 1)
        XCTAssertEqual(self.tableView.numberOfRows(inSection: 1), 1)
    }
    
    func testTableViewSectionTitles_ShouldHaveCorrectValues() {
        self.movieLibraryDataService.movieManager?.addMovieToLibrary(movie: TestExample.Movie(title: "Hobbit1"))
        self.movieLibraryDataService.movieManager?.addMovieToLibrary(movie: TestExample.Movie(title: "Hobbit2"))
        self.movieLibraryDataService.movieManager?.favouriteMovieAtIndex(index: 0)
        self.tableView.reloadData()
        
        let titleSectionOne = self.tableView.dataSource?.tableView!(self.tableView, titleForHeaderInSection: 0)
        let titleSectionTwo = self.tableView.dataSource?.tableView!(self.tableView, titleForHeaderInSection: 1)
        
        XCTAssertEqual(titleSectionOne, "Movies To See")
        XCTAssertEqual(titleSectionTwo, "Movies Seen")
        
    }
}

