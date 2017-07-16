//
//  MovieCellTests.swift
//  TestExample
//
//  Created by Pawel Trojan on 16.07.2017.
//  Copyright © 2017 ptrojan. All rights reserved.
//

import XCTest
@testable import TestExample

class MovieCellTests: XCTestCase {
    
    var tableView: UITableView!
    var dataSource: MockCellDataSource!
    
    override func setUp() {
        super.setUp()
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let movieLibraryViewController = storyBoard.instantiateViewController(withIdentifier: "MovieLibraryViewController") as! MovieLibraryViewController
        _ = movieLibraryViewController.view
        
        self.tableView = movieLibraryViewController.movieTableView
        self.dataSource = MockCellDataSource()
        self.tableView.dataSource = self.dataSource
    }
    
    override func tearDown() {
        super.tearDown()
        self.tableView = nil
        self.dataSource = nil
    }
    
    func testCellConfig_ShouldSetLabelsToMovieData() {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: IndexPath(row: 0, section: 0)) as! MovieCell
        cell.configureCell(withMovie: TestExample.Movie(title: "God of war", releaseDate: "12/04/1975"))
        
        XCTAssertEqual(cell.textLabel?.text, "God of war")
        XCTAssertEqual(cell.detailTextLabel?.text, "12/04/1975")

    }
    
}
