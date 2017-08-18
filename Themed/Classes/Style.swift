//
//  Style.swift
//  BALTheme
//
//  Created by Brian Bal on 8/16/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit

open class Style {

    public var name : String
    public var theme : String = "default"
    
    public init(_ name: String) {
        self.name = name
    }
    
    open func apply(_ view: UIView) {
    }
    
}

public class SimpleStyle : Style {
    
    private var styleBlock : ((UIView) -> Void)
    
    init(_ name: String, style: @escaping ((UIView) -> Void)) {
        styleBlock = style
        super.init(name)
    }
    
    public override func apply(_ view: UIView) {
        styleBlock(view)
    }
    
}
