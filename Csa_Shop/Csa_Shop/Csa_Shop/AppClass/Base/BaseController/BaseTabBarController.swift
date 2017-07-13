//
//  BaseTabBarController.swift
//  Csa_Shop
//
//  Created by CHC on 2017/7/10.
//  Copyright © 2017年 CHC. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let homeVC = HomeViewController.init();
        homeVC.tabBarItem = UITabBarItem.init(title: homeName, image: UIImage.init(named: "home_page_icon"), selectedImage: UIImage.init(named: "home_page_select_icon"));
        let homeNavController = BaseNavigationController.init(rootViewController: homeVC);
        //
        let categoryVC = CategoryViewController.init();
        categoryVC.tabBarItem = UITabBarItem.init(title: categoryName, image: UIImage.init(named: "classified_page_icon"), selectedImage: UIImage.init(named: "classified_page_back_icon"));
        let categoryNavController = BaseNavigationController.init(rootViewController: categoryVC);
        //
        let blogVC = BlogViewController.init();
        blogVC.tabBarItem = UITabBarItem.init(title: blogName, image: UIImage.init(named: "message_normal"), selectedImage: UIImage.init(named: "message_select"));
        let blogNavController = BaseNavigationController.init(rootViewController: blogVC);
        //
        let cartVC = CartViewController.init();
        cartVC.tabBarItem = UITabBarItem.init(title: cartName, image: UIImage.init(named: "shopping_page_icon"), selectedImage: UIImage.init(named: "prodcut_detail_select_shopcart"));
        let cartNavController = BaseNavigationController.init(rootViewController: cartVC);
        //
        let centerVC = CenterViewController.init();
        centerVC.tabBarItem = UITabBarItem.init(title: centerName, image: UIImage.init(named: "my_page_icon"), selectedImage: UIImage.init(named: "my_page_select_icon"));
        let centerNavController = BaseNavigationController.init(rootViewController: centerVC);
        //
        self.viewControllers = [homeNavController,categoryNavController,blogNavController,cartNavController,centerNavController];
        
        
        self.tabBar.isTranslucent = false;  //避免受默认的半透明色影响，关闭
        self.tabBar.tintColor = UIColor.colorWithHexString(hex: color_main); //设置选中颜色，这里使用黄色
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
