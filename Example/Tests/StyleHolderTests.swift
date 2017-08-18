//
//  StyleHolderTests.swift
//  Themed
//
//  Created by Brian Bal on 8/18/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import XCTest
import UIKit
@testable import Themed

class StyleHolderTests: XCTestCase {
    
    var view : UIView? = UIView()
    var styleHolder : StyleHolder?
    
    override func setUp() {
        super.setUp()
        
        Theme.reset()
        Theme.add("test") { (view) in
            view.backgroundColor = UIColor.red
        }
        Theme.add("another") { (view) in
            view.layer.cornerRadius = 8
        }
        
        view = UIView()
        view?.backgroundColor = UIColor.white
        styleHolder = StyleHolder(view: view!, styles: ["test", "another"])
        
        objc_setAssociatedObject(view, &UIView.AssociatedKeys.styleHolder, styleHolder, .OBJC_ASSOCIATION_RETAIN)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        view = nil
        styleHolder = nil
    }
    
    // StyleHolder.init should initialize view, styles, and register for style changes
    func test_init() {
        XCTAssertEqual(view, styleHolder?.view)
        XCTAssertEqual(["test", "another"], styleHolder!.styles)
        
        // indirectly test register for style changes
        XCTAssertEqual(UIColor.white, view?.backgroundColor)
        NotificationCenter.default.post(name: Notification.Name("THEMED_STYLE_CHANGED_test"), object: nil)
        XCTAssertEqual(UIColor.red, view?.backgroundColor)
    }
    
    func test_registerForStyleChanges() {
        styleHolder?.unregisterForStyleChanges(removeStyles: styleHolder!.styles)
        styleHolder?.registerForStyleChanges()
        
        // indirectly test register for style changes
        XCTAssertEqual(UIColor.white, view?.backgroundColor)
        NotificationCenter.default.post(name: Notification.Name("THEMED_STYLE_CHANGED_test"), object: nil)
        XCTAssertEqual(UIColor.red, view?.backgroundColor)
    }
    
    func test_unregisterForStyleChanges() {
        styleHolder?.unregisterForStyleChanges(removeStyles: styleHolder!.styles)
        
        // indirectly test unregister for style changes
        XCTAssertEqual(UIColor.white, view?.backgroundColor)
        NotificationCenter.default.post(name: Notification.Name("THEMED_STYLE_CHANGED_test"), object: nil)
        XCTAssertEqual(UIColor.white, view?.backgroundColor)
    }
    
    func test_applyStyle() {
        styleHolder?.onStylesChanged(notif: NSNotification(name: Notification.Name("THEMED_STYLE_CHANGED_test"), object: nil))
        XCTAssertEqual(UIColor.red, view?.backgroundColor)
        XCTAssertEqual(8, view!.layer.cornerRadius)
    }
    
    
    
}
