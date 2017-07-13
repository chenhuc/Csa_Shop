//
//  CenterViewCell.swift
//  Csa_Shop
//
//  Created by CHC on 2017/7/12.
//  Copyright © 2017年 CHC. All rights reserved.
//

import UIKit
import SnapKit


class CenterViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = UITableViewCellSelectionStyle.none
        prepareCenterView()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    func prepareCenterView() {
        self.contentView.addSubview(self.iconImageView)
        self.contentView.addSubview(self.titleNameLabel)
        self.contentView.addSubview(self.rightImageView)
        self.iconImageView.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView.snp.left).offset(10)
            make.top.equalTo(self.contentView.snp.top).offset(10)
            make.bottom.equalTo(self.contentView.snp.bottom).offset(-10)
            make.width.equalTo(self.iconImageView.snp.height).multipliedBy(1);
        }
        
        self.titleNameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.iconImageView.snp.right).offset(10)
            make.centerY.equalTo(self.contentView.snp.centerY)
            make.right.equalTo(self.contentView.snp.right).offset(-30)
            make.height.equalTo(30);
        }
        
        self.rightImageView.snp.makeConstraints { (make) in
            make.left.equalTo(self.titleNameLabel.snp.right)
            make.centerY.equalTo(self.contentView.snp.centerY)
            make.right.equalTo(self.contentView.snp.right).offset(-10)
            make.height.equalTo(20);
        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    // 懒加载
    var titleNameLabel : UILabel = {
        let label = UILabel()
        label.text = "标题"
        label.textAlignment = NSTextAlignment.left
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    var iconImageView : UIImageView = {
        let iconTmpImageView = UIImageView()
        iconTmpImageView.backgroundColor = UIColor.orange
        iconTmpImageView.layer.cornerRadius = 5;
        iconTmpImageView.layer.masksToBounds = true
        return iconTmpImageView
    }()
    
    var rightImageView : UIImageView = {
        let rightTmpImageView = UIImageView()
        rightTmpImageView.backgroundColor = UIColor.orange
        return rightTmpImageView
    }()

}
