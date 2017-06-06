//
//  MainViewControllerTests.swift
//  TestExample
//
//  Created by Pawel Trojan on 07.06.2017.
//  Copyright © 2017 ptrojan. All rights reserved.
//

import XCTest
@testable import TestExample

class MainViewControllerTests: XCTestCase {
    
    var mainViewController: UIViewController?
    var clickButton: UIButton?
    
    override func setUp() {
        super.setUp()
      
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        self.mainViewController = storyBoard.instantiateViewController(withIdentifier: "MainViewController")
        _ = self.mainViewController?.view
        //"goToNextController"        
    }
    
    func testIfMainViewControllerExist() {
        XCTAssertNotNil(self.mainViewController)
    }
    
    func testTitleMainViewController() {
        XCTAssertEqual(self.mainViewController?.title, "MainViewController")
    }
    
    func testIfVcIsMainViewController() {
        XCTAssert(self.mainViewController is MainViewController)
    }
    
    func testMainViewControllerContainClickBtn() {
        
        if let mainViewController = mainViewController as? MainViewController {
           XCTAssertNotNil(mainViewController.click)
        }
        else {
          XCTAssert(false)  
        }
        
    }
    
    override func tearDown() {
        super.tearDown()
        self.mainViewController = nil
    }
    
    
}
