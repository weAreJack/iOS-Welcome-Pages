//
//  UIColorExtension.swift
//  autolayout_welcome_pages
//
//  Created by Jack Smith on 01/09/2019.
//  Copyright © 2019 jack-adam-smith. All rights reserved.
//

import UIKit

extension UIColor {
    
    static let colour1 = UIColor(r: 52, g: 89, b: 149)
    static let colour2 = UIColor(r: 3, g: 206, b: 164)
    static let colour3 = UIColor(r: 251, g: 77, b: 61)
    static let colour4 = UIColor(r: 202, g: 21, b: 82)
    static let colour5 = UIColor(r: 75, g: 100, b: 74)
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: a)
    }
    
}
