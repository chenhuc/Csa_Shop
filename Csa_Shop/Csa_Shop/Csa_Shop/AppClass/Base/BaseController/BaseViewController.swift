//
//  BaseViewController.swift
//  Csa_Shop
//
//  Created by CHC on 2017/7/10.
//  Copyright © 2017年 CHC. All rights reserved.
//

import UIKit

var pageSize = NSInteger.init();
var isRefreshHeader = Bool.init();
var keyBoardHiddenChangeY = Float.init();
var keyBoardShowChangeY = Float.init();
var keyBoardHiddenTime = Float.init();
var keyBoardShowTime = Float.init();

class BaseViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.colorWithHexString(hex: color_white);
        pageSize = 10;
        isRefreshHeader = true;
        self.automaticallyAdjustsScrollViewInsets = false;
        NotificationCenter.default.addObserver(self, selector: #selector(my_keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil);
        NotificationCenter.default.addObserver(self, selector: #selector(my_keyboardWillHidden(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil);
    }
    
    func my_keyboardWillShow(notification: Notification) {
        //获取userInfo
        let kbInfo = notification.userInfo
        //获取键盘的size
        let kbRect = (kbInfo?[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        //键盘的y偏移量
        keyBoardShowChangeY = Float(kbRect.origin.y - self.view.frame.size.height);
        //键盘弹出的时间
        keyBoardShowTime = Float(kbInfo?[UIKeyboardAnimationDurationUserInfoKey] as!Double)
    }
    
    func my_keyboardWillHidden(notification: Notification) {
        //获取userInfo
        let kbInfo = notification.userInfo
        //获取键盘的size
        let kbRect = (kbInfo?[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        //键盘的y偏移量
        keyBoardHiddenChangeY = Float(kbRect.origin.y - self.view.frame.size.height);
        //键盘弹出的时间
        keyBoardHiddenTime = Float(kbInfo?[UIKeyboardAnimationDurationUserInfoKey] as!Double)
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
