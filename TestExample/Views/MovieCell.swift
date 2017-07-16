//
//  MovieCell.swift
//  TestExample
//
//  Created by Pawel Trojan on 16.07.2017.
//  Copyright © 2017 ptrojan. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    func configureCell(withMovie: TestExample.Movie) {
        self.textLabel?.text = withMovie.title
        self.detailTextLabel?.text = withMovie.releaseDate
    }

}
