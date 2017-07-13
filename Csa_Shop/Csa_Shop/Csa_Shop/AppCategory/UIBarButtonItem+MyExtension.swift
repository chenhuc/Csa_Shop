//
//  UIBarButtonItem+MyExtension.swift
//  Csa_Shop
//
//  Created by CHC on 2017/7/12.
//  Copyright © 2017年 CHC. All rights reserved.
//

import Foundation
import UIKit

extension UIBarButtonItem {
    
    /**
     *  字符item
     */
    static func nameButtonItem(titleName:String ,select: Selector ,target: AnyObject) -> UIBarButtonItem {
        let titleBarButtonItem = nameButtonItem(titleName: titleName, select: select, target: target, edgs: UIEdgeInsetsMake(0, 0, 0, 0))
        return titleBarButtonItem
    }
    /**
     *
     */
    static func nameButtonItem(titleName:String ,select: Selector ,target: AnyObject, color: UIColor) -> UIBarButtonItem {
        let titleBarButtonItem = nameButtonItem(titleName: titleName, select: select, target: target, color: color, edgs: UIEdgeInsetsMake(0, 0, 0, 0))
        return titleBarButtonItem
    }
    
    static func nameButtonItem(titleName:String ,select: Selector ,target: AnyObject, edgs:UIEdgeInsets) -> UIBarButtonItem {
        let titleBarButtonItem = nameButtonItem(titleName: titleName, select: select, target: target, color: UIColor.white, edgs: edgs)
        return titleBarButtonItem
    }
    
    static func nameButtonItem(titleName:String ,select: Selector ,target: AnyObject,color:UIColor, edgs:UIEdgeInsets) -> UIBarButtonItem {
        let namebtn = UIButton.init(type:.custom);
        namebtn.frame =  CGRect(x:0,y:0,width:40,  height:40);
        namebtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        namebtn.setTitle(titleName, for: UIControlState.normal);
        namebtn.setTitle(titleName, for: UIControlState.highlighted);
        namebtn.setTitle(titleName, for: UIControlState.selected);
        namebtn.setTitleColor(color, for: UIControlState.normal);
        namebtn.setTitleColor(color, for: UIControlState.highlighted);
        namebtn.setTitleColor(color, for: UIControlState.selected);
        namebtn.addTarget(target, action:select , for: UIControlEvents.touchUpInside);
        namebtn.titleEdgeInsets = edgs
        let titleBarButtonItem = UIBarButtonItem.init(customView: namebtn)
        return titleBarButtonItem
    }
    
    static func imageButtonItem(imageName:String ,select: Selector ,target: AnyObject) -> UIBarButtonItem {
        let imageBarButtonItem = imageButtonItem(imageName: imageName, select: select, target: target, edgs: UIEdgeInsetsMake(0, 0, 0, 0))
        return imageBarButtonItem
    }
    
    static func imageButtonItem(imageName:String ,select: Selector ,target: AnyObject, edgs:UIEdgeInsets) -> UIBarButtonItem {
        let imagebtn = UIButton.init(type:.custom);
        imagebtn.frame =  CGRect(x:0,y:0,width:40,  height:40);
        imagebtn.setImage(UIImage.init(named:imageName), for: UIControlState.normal);
        imagebtn.setImage(UIImage.init(named:imageName), for: UIControlState.highlighted);
        imagebtn.setImage(UIImage.init(named:imageName), for: UIControlState.selected);
        imagebtn.addTarget(target, action:select , for: UIControlEvents.touchUpInside);
        imagebtn.imageEdgeInsets = edgs
        let imageBarButtonItem = UIBarButtonItem.init(customView: imagebtn)
        return imageBarButtonItem
    }
}
