//
//  CenterViewController.swift
//  Csa_Shop
//
//  Created by CHC on 2017/7/10.
//  Copyright © 2017年 CHC. All rights reserved.
//  个人中心

import UIKit


class CenterViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {

    var centerTableView : UITableView!
    var centerDataArray = NSMutableArray()
    var headerView:UIView!
    var userImageView:UIImageView!
    var userNameLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.centerDataArray = NSMutableArray.init(array: [centerHealthNurse,centerMyJoin,centerCart,centerMyorder,centerMyCollect,centerCSACustom])
        self.navigationItem.title = centerTitleName;
        let settingItem = UIBarButtonItem.imageButtonItem(imageName: "setting", select: #selector(settingButtonClick(btn:)), target: self)
        let messageItem = UIBarButtonItem.imageButtonItem(imageName: "message", select: #selector(settingButtonClick(btn:)), target: self)
        self.navigationItem.rightBarButtonItems = [messageItem,settingItem]
        prepareCenterTableView()
        
    }
    
    func prepareCenterTableView(){
        
        self.headerView = UIView.init(frame: CGRect(x:0,y:0,width:kScreenWidth,height:180*kScale))
        self.headerView.backgroundColor = UIColor.colorWithHexString(hex: color_main)
        //
        self.userImageView = UIImageView.init()
        self.userImageView.backgroundColor = UIColor.orange
        self.userImageView.layer.cornerRadius = 50*kScale
        self.userImageView.layer.masksToBounds = true
        self.headerView .addSubview(self.userImageView)
        //
        self.userNameLabel = UILabel.init()
        self.userNameLabel.text = "听风雨";
        self.userNameLabel.font = UIFont.systemFont(ofSize: 18)
        self.userNameLabel.textColor = UIColor.white
        self.headerView .addSubview(self.userNameLabel)
        
        self.centerTableView = UITableView.init(frame: CGRect(x:0,y:0,width:0,height:0), style: UITableViewStyle.plain)
        self.centerTableView.delegate = self;
        self.centerTableView.dataSource = self;
        self.centerTableView.tableHeaderView = self.headerView
        self.centerTableView.tableFooterView = UIView.init()
        self.view.addSubview(self.centerTableView);
        
        self.centerTableView.snp.makeConstraints { (make) in
            make.left.equalTo(self.view.snp.left)
            make.right.equalTo(self.view.snp.right)
            make.bottom.equalTo(self.view.snp.bottom).offset(-49)
            make.top.equalTo(self.view.snp.top)
        }
        self.userImageView.snp.makeConstraints { (make) in
            make.left.equalTo(self.headerView.snp.left).offset(20*kScale)
            make.width.height.equalTo(100*kScale)
            make.bottom.equalTo(self.headerView.snp.bottom).offset(-20)
        }
        self.userNameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.userImageView.snp.right).offset(10*kScale)
            make.height.equalTo(30*kScale)
            make.centerY.equalTo(self.userImageView.snp.centerY)
            make.right.equalTo(self.headerView.snp.right).offset(-10*kScale)
        }
    }
    
    func settingButtonClick(btn : UIButton){
        let settingVC = SettingViewController.init()
        settingVC.navigationItem.title = mySetting
        self.navigationController?.pushViewController(settingVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.centerDataArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80*kScale
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:CenterViewCell! = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier") as? CenterViewCell
        if (cell ==  nil) {
            cell = CenterViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: "cellIdentifier")
        }
        cell?.backgroundColor = UIColor.white
        cell?.titleNameLabel.text = self.centerDataArray[indexPath.row] as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let titleName:String = self.centerDataArray[indexPath.row] as! String
        switch indexPath.row {
        case 0:
            let healthNurseVC = HealthNurseViewController.init()
            healthNurseVC.navigationItem.title = titleName
            self.navigationController?.pushViewController(healthNurseVC, animated: true)
            break
        case 1:
            let myJoinVC = MyJoinViewController.init()
            myJoinVC.navigationItem.title = titleName
            self.navigationController?.pushViewController(myJoinVC, animated: true)
            break
        case 2:
            let cartVC = CartViewController.init()
            cartVC.navigationItem.title = titleName
            self.navigationController?.pushViewController(cartVC, animated: true)
            break
        case 3:
            let myOrderVC = MyOrderViewController.init()
            myOrderVC.navigationItem.title = titleName
            self.navigationController?.pushViewController(myOrderVC, animated: true)
            break
        case 4:
            let myCollectVC = MyCollectViewController.init()
            myCollectVC.navigationItem.title = titleName
            self.navigationController?.pushViewController(myCollectVC, animated: true)
            break
        case 5:
            let csaCustomVC = CSACustomViewController.init()
            csaCustomVC.navigationItem.title = titleName
            self.navigationController?.pushViewController(csaCustomVC, animated: true)
            break
        default:
            break
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.my_setBackgroundColor(backgroundColor: UIColor.colorWithHexString(hex: color_main))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.my_setBackgroundColor(backgroundColor: UIColor.clear)
        self.navigationController?.navigationBar.shadowImage = UIImage.init();
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y < 0 {
            self.centerTableView.isScrollEnabled = false
            self.navigationController?.navigationBar.my_setBackgroundColor(backgroundColor: UIColor.clear)
        }
        else if scrollView.contentOffset.y > 64 {
            self.navigationController?.navigationBar.my_setBackgroundColor(backgroundColor: UIColor.colorWithHexString(hex: color_main))
        }
        else{
            self.centerTableView.isScrollEnabled = true
            self.navigationController?.navigationBar.my_setBackgroundColor(backgroundColor: UIColor.clear)
        }
        
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
