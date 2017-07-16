//
//  DropShadowViewTests.swift
//  TestExample
//
//  Created by Pawel Trojan on 16.07.2017.
//  Copyright © 2017 ptrojan. All rights reserved.
//

import XCTest
@testable import TestExample

class DropShadowViewTests: XCTestCase {
    
    var dropShadowView: DropShadowView!
    
    override func setUp() {
        super.setUp()
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let mainViewController = storyBoard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        _ = mainViewController.view
        self.dropShadowView = mainViewController.dropShadowView 
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPrepareForInterfaceBuider_ShouldBeExcecute() {
        dropShadowView?.prepareForInterfaceBuilder()
        XCTAssertTrue(self.dropShadowView.isPrepareForInterfaceBuilderExcetute)
    }
    
}
