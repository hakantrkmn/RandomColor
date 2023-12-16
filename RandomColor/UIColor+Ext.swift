//
//  UIColor+Ext.swift
//  RandomColor
//
//  Created by Hakan Türkmen on 16.12.2023.
//

import UIKit


extension UIColor{
    
    static func random()->UIColor{
        let randomColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
        return randomColor
    }
}
