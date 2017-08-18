//
//  StyleTests.swift
//  Themed
//
//  Created by Brian Bal on 8/18/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import XCTest
import UIKit
@testable import Themed

class StyleTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // Style.init should set anme and theme property
    func test_base_init() {
        let style = Style("test")
        XCTAssertEqual("test", style.name)
        XCTAssertEqual("default", style.theme)
    }
    
    // Style.theme should be able to get and set a string value
    func test_base_theme() {
        let style = Style("test")
        style.theme = "A"
        XCTAssertEqual("A", style.theme)
    }
    
    // SimpleStyle.init should initialize styleBlock, name, theme
    func test_simple_init() {
        var test = 0
        let block : ((UIView) -> Void) = { view in
            test += 1
        }
        let style = SimpleStyle("simple_test", style: block)
        
        style.styleBlock(UIView())
        XCTAssertEqual(1, test)
        
        XCTAssertEqual("simple_test", style.name)
        XCTAssertEqual("default", style.theme)
    }
    
    // SimpleStyle.apply should call the styleBlock with a passed view argument
    func test_simple_apply() {
        var test = 0
        let block : ((UIView) -> Void) = { view in
            test += 1
        }
        let style = SimpleStyle("simple_test", style: block)
        
        style.apply(UIView())
        XCTAssertEqual(1, test)
    }
    
}
