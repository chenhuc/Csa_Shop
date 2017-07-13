//
//  BaseNavigationController.swift
//  Csa_Shop
//
//  Created by CHC on 2017/7/10.
//  Copyright © 2017年 CHC. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let dict:NSDictionary = [NSForegroundColorAttributeName: UIColor.colorWithHexString(hex: color_white),NSFontAttributeName : UIFont.boldSystemFont(ofSize: 18)];
        self.navigationBar.isTranslucent = true;
        //标题颜色
        self.navigationBar.titleTextAttributes = dict as? [String : AnyObject];
        //item颜色
        self.navigationBar.barTintColor = UIColor.colorWithHexString(hex: color_main);
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if (self.viewControllers.count > 0) {
            let backBtn = UIButton.init(type: .custom);
            backBtn.frame =  CGRect(x:0,y:0,width:40,  height:40);
            backBtn.setImage(UIImage.init(named: "white_back@2x"), for: UIControlState.normal);
            backBtn.setImage(UIImage.init(named: "white_back@2x"), for: UIControlState.highlighted);
            backBtn.setImage(UIImage.init(named: "white_back@2x"), for: UIControlState.selected);
            backBtn.addTarget(self, action: #selector(backButtonItemClick(btn:)), for: UIControlEvents.touchUpInside);
            backBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
            let backBarItem = UIBarButtonItem.init(customView: backBtn);
            viewController.navigationItem.leftBarButtonItem = backBarItem;
            viewController.hidesBottomBarWhenPushed = true;
        }
        super.pushViewController(viewController, animated: true);
    }
    
    func backButtonItemClick(btn:UIButton?) {
        popViewController(animated: true);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
