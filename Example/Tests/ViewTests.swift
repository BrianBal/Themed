//
//  ViewTests.swift
//  Themed
//
//  Created by Brian Bal on 8/18/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import XCTest
import UIKit
@testable import Themed

class ViewTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_get_set_styles() {
        let view = UIView()
        view.styles = ["test", "apple", "bear"]
        XCTAssertEqual(["test", "apple", "bear"], view.styles)
    }
    
    
    func test_applyStyles() {
        Theme.add("test") { (view) in
            view.tag = 12
        }
        Theme.add("apple") { (view) in
            view.backgroundColor = UIColor.red
        }
        Theme.add("bear") { (view) in
            view.layer.cornerRadius = 21
        }
        
        let view = UIView()
        view.styles = ["test", "apple", "bear"]
        
        // setting styles should call applyStyles
        
        XCTAssertEqual(UIColor.red, view.backgroundColor)
        XCTAssertEqual(12, view.tag)
        XCTAssertEqual(21, view.layer.cornerRadius)
    }
    
}
