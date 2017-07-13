//
//  BannerView.swift
//  Csa_Shop
//
//  Created by CHC on 2017/7/11.
//  Copyright © 2017年 CHC. All rights reserved.
//  轮播图

import UIKit

class BannerView: UIView,UIScrollViewDelegate {
    var bannerScrollView:UIScrollView!
    var bannerDataArray:NSMutableArray!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        setupSubviews();
    }
    
    convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupSubviews()
    }
    
    func setupSubviews() {
        self.bannerScrollView = UIScrollView.init(frame: self.frame)
        self.bannerScrollView.delegate = self
        self.bannerScrollView.backgroundColor = UIColor.white
        self.addSubview(self.bannerScrollView)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
    }
}
