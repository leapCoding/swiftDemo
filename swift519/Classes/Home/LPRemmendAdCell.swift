//
//  LPRemmendAdCell.swift
//  swift519
//
//  Created by 李鹏 on 2017/7/19.
//  Copyright © 2017年 李鹏. All rights reserved.
//

import UIKit

class LPRemmendAdCell: UITableViewCell {
    @IBOutlet var topImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configData(home: LPHomeModel) {
        topImageView.setImage(home.characteristics, "")
        if let ads = home.recommendAds {
            for recommendAds in ads {
                let imageview = viewWithTag(recommendAds.position+1) as! UIImageView
                imageview.setImage(recommendAds.pic, "")
            }
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
