//
//  MovieLibrarysDataService.swift
//  TestExample
//
//  Created by Pawel Trojan on 10.07.2017.
//  Copyright © 2017 ptrojan. All rights reserved.
//

import UIKit

class MovieLibraryDataService: NSObject {
    
}

//MARK: UITableViewDataSource
extension MovieLibraryDataService: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell()
    }
}
//MARK: UITableViewDelegate
extension MovieLibraryDataService: UITableViewDelegate {
    
}
