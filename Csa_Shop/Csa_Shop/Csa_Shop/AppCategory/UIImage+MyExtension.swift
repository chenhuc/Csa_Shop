//
//  UIImage_MyExtension.swift
//  Csa_Shop
//
//  Created by CHC on 2017/7/11.
//  Copyright © 2017年 CHC. All rights reserved.
//

import Foundation
import CoreFoundation
import UIKit
import QuartzCore

extension UIImage {
    public func imageWithColor(colorString:String) -> UIImage {
        let color = UIColor.colorWithHexString(hex: colorString);
        UIGraphicsBeginImageContext(self.size);
        color.setFill();
        let bounds = CGRect.init(x: 0, y: 0, width: self.size.width, height: self.size.height)
        UIRectFill(bounds);
        self.draw(in: bounds, blendMode: CGBlendMode.destinationIn, alpha: 1.0)
        let tintedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return tintedImage!
    }
}
