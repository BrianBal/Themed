//
//  ThemeTests.swift
//  Themed
//
//  Created by Brian Bal on 8/18/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import XCTest
import UIKit
@testable import Themed

class ThemeTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        Theme.reset()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_add() {
        var test = 0
        Theme.add("test1") { (view) in
            test += 1
        }
        
        let style = Theme.get("test1")
        XCTAssertNotNil(style)
        XCTAssertEqual("test1", style!.name)
        style?.apply(UIView())
        XCTAssertEqual(1, test)
    }
    
    func test_get() {
        var test = 0
        Theme.add("test1") { (view) in
            test += 1
        }
        
        let style = Theme.get("test1")
        XCTAssertNotNil(style)
        XCTAssertEqual("test1", style!.name)
        style?.apply(UIView())
        XCTAssertEqual(1, test)
    }
    
    func test_reset() {
        var test = 0
        Theme.add("test1") { (view) in
            test += 1
        }
        Theme.reset()
        
        let style = Theme.get("test1")
        XCTAssertNil(style)
    }
    
    func test_add_should_replace() {
        var test = 0
        Theme.add("test1") { (view) in
            test += 1
        }
        Theme.add("test1") { (view) in
            test += 3
        }
        
        let style = Theme.get("test1")
        XCTAssertNotNil(style)
        XCTAssertEqual("test1", style!.name)
        style?.apply(UIView())
        XCTAssertEqual(3, test)
    }
    
    func test_add_should_notify() {
        Theme.add("test1") { (v) in
            v.backgroundColor = UIColor.white
        }
        
        let view = UIView()
        view.styles = ["test1"]
        
        Theme.add("test1") { (v) in
            v.backgroundColor = UIColor.red
        }
        
        // indirectly test for notification
        XCTAssertEqual(UIColor.red, view.backgroundColor!)
    }
    
}
