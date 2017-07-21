//
//  LPHomeRecommedCollectCell.swift
//  swift519
//
//  Created by 李鹏 on 2017/7/20.
//  Copyright © 2017年 李鹏. All rights reserved.
//

import UIKit

class LPHomeRecommedCollectCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    class func cellSize() -> CGSize {
        return CGSize(width: (kScreenWidth-4)/2, height: (kScreenWidth-4)/2+65)
    }
}
