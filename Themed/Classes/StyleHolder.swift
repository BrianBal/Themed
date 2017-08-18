//
//  StyleHolder.swift
//  Pods-Themed_Example
//
//  Created by Brian Bal on 8/17/17.
//

import UIKit

class StyleHolder {
    
    weak var view : UIView?
    
    private var _styles = [String]()
    var styles : [String] {
        get {
            return _styles
        }
        set {
            unregisterForStyleChanges(removeStyles: _styles)
            _styles = newValue
            registerForStyleChanges()
        }
    }
    
    init(view: UIView, styles: [String]) {
        self.view = view
        self.styles = styles
        registerForStyleChanges()
    }
    
    deinit {
        unregisterForStyleChanges(removeStyles: _styles)
    }
    
    public func registerForStyleChanges() {
        for style in styles {
            NotificationCenter.default.addObserver(self, selector: #selector(onStylesChanged), name: NSNotification.Name("THEMED_STYLE_CHANGED_\(style)"), object: nil)
        }
    }
    
    public func unregisterForStyleChanges(removeStyles: [String]) {
        for style in removeStyles {
            NotificationCenter.default.removeObserver(self, name: NSNotification.Name("THEMED_STYLE_CHANGED_\(style)"), object: nil)
        }
    }
    
    @objc public func onStylesChanged(notif: NSNotification) {
        view?.applyStyle()
    }
    
    
}
