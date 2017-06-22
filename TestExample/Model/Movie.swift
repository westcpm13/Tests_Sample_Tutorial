//
//  Movie.swift
//  TestExample
//
//  Created by Pawel Trojan on 06.06.2017.
//  Copyright © 2017 ptrojan. All rights reserved.
//

import Foundation

struct Movie {
    let title: String?
    let releaseDate: String?
    
    init(title: String?, releaseDate: String? = nil) {
        self.title = title
        self.releaseDate = releaseDate
    }
}
