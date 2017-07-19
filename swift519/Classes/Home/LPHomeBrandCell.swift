//
//  LPHomeBrandCell.swift
//  swift519
//
//  Created by 李鹏 on 2017/7/18.
//  Copyright © 2017年 李鹏. All rights reserved.
//

import UIKit

class LPHomeBrandCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
//        imageTitle.co
    }
    
    func configUI(itmes:[HomeBrands]?) {
        if let itemArray = itmes {
            removeAllSubviews()
            for (index, value) in itemArray.enumerated() {
                let page = index/8;
                let x = index%4;
                let y = (index-(page*8))/4;
                
                let imageTitle = LPImageTitleView.imageTitleView()
                imageTitle.frame = CGRect(x: kScreenWidth/4*CGFloat(x), y: kScreenWidth/4*CGFloat(y), width: kScreenWidth/4, height: kScreenWidth/8 + 70)
                imageTitle.config(images: value.pic!, titles: value.name!)
                addSubview(imageTitle)
                
            }
        }
    }
    
    class func cellHeight(itmes:[HomeBrands]?) -> CGFloat {
        if let itemArray = itmes {
            if itemArray.count > 4 {
                return (kScreenWidth/8 + 60)*2
            }else {
                return kScreenWidth/8 + 60
            }
        }else {
            return 0
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
