//
//  BALView.swift
//  BALTheme
//
//  Created by Brian Bal on 8/16/17.
//  Copyright © 2017 Brian Bal. All rights reserved.
//

import UIKit
import ObjectiveC

public extension UIView {

    private struct AssociatedKeys {
        static var styleHolder = "themed_styleholder"
    }

    var styles : [String] {
        get {
            let assocObj = objc_getAssociatedObject(self, &AssociatedKeys.styleHolder)
            let styleHolder : StyleHolder = assocObj as? StyleHolder ?? StyleHolder(view: self, styles: [])
            return styleHolder.styles
        }
        set {
            let assocObj = objc_getAssociatedObject(self, &AssociatedKeys.styleHolder)
            let styleHolder : StyleHolder = assocObj as? StyleHolder ?? StyleHolder(view: self, styles: [])
            styleHolder.styles = newValue
            objc_setAssociatedObject(self, &AssociatedKeys.styleHolder, styleHolder, .OBJC_ASSOCIATION_RETAIN)
            applyStyle()
        }
    }

    public func applyStyle() {
        for s in styles {
            if let styleObj = Theme.get(s) {
                styleObj.apply(self)
            }
        }
    }

}
