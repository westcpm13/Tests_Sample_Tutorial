//
//  ViewController.swift
//  TestExample
//
//  Created by ptrojan on 24.05.2017.
//  Copyright © 2017 ptrojan. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var dropShadowView: DropShadowView!

    @IBOutlet weak var click: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Main"
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

