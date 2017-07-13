//
//  HomeViewController.swift
//  Csa_Shop
//
//  Created by CHC on 2017/7/10.
//  Copyright © 2017年 CHC. All rights reserved.
//

import UIKit





class HomeViewController: BaseViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = homeTitleName;
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.imageButtonItem(imageName: "search", select: #selector(searchButtonItemClick(btn:)), target: self)
    }

    func searchButtonItemClick(btn:UIButton?) {
        let searchVC = SearchViewController.init();
        searchVC.navigationItem.title = "商品搜索";
        self.navigationController?.pushViewController(searchVC, animated: true);
        
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
