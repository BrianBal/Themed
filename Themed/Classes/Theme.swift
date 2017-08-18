//
//  Theme.swift
//  BALTheme
//
//  Created by Brian Bal on 8/16/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit

public class Theme {
    
    public static let current = Theme()
    
    public static func add(_ key: String, action: @escaping ((UIView) -> Void)) {
        self.current.addStyle(key, action: action)
    }
    
    public static func get(_ key: String) -> Style? {
        return self.current.getStyle(key)
    }
    
    public static func reset() {
        self.current.resetStyles()
    }
    
    var styles = [String : Style]()

    public func addStyle(_ key: String, action: @escaping ((UIView) -> Void)) {
        styles[key] = SimpleStyle(key, style: action)
        NotificationCenter.default.post(name: NSNotification.Name("BALTHEME_STYLE_CHANGED"), object: nil)
    }

    public func getStyle(_ key: String) -> Style? {
        return styles[key]
    }
    
    public func resetStyles() {
        styles.removeAll()
    }

}
