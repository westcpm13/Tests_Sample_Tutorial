//
//  MocksExtensions.swift
//  TestExample
//
//  Created by Pawel Trojan on 16.07.2017.
//  Copyright © 2017 ptrojan. All rights reserved.
//

import Foundation
import UIKit
@testable import TestExample


extension MovieLibraryDataServiceTests {
    class TableViewMock: UITableView {
        var cellDequeueProperthy = false
        
        override func dequeueReusableCell(withIdentifier identifier: String) -> UITableViewCell? {
            self.cellDequeueProperthy = true
            return super.dequeueReusableCell(withIdentifier: identifier)
        }
        
        class func initializeTableViewMock() -> TableViewMock {
            let tableViewMock = TableViewMock(frame: CGRect.init(x: 0, y: 0, width: 300, height: 500), style: .plain)
            tableViewMock.register(MovieCellMock.self, forCellReuseIdentifier: "MovieCell")
            
            return tableViewMock
        }
        
    }
    
    class MovieCellMock: MovieCell {
        var movie:  TestExample.Movie?

        override func configureCell(withMovie: TestExample.Movie) {
            self.movie = withMovie
        }
    }
}

extension MovieCellTests {
    
    class MockCellDataSource: NSObject, UITableViewDataSource {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            return UITableViewCell()
        }
        
    }
}



