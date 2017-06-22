//
//  ViewController.swift
//  TestExample
//
//  Created by ptrojan on 24.05.2017.
//  Copyright © 2017 ptrojan. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var click: UIButton!
    var calledSegue: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "MainViewController"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func performSegue(withIdentifier identifier: String, sender: Any?) {
        super.performSegue(withIdentifier:identifier , sender: sender)
        
        self.calledSegue = identifier
        
    }
    
}

