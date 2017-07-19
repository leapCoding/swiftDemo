//
//  LPImageTitleView.swift
//  swift519
//
//  Created by 李鹏 on 2017/7/18.
//  Copyright © 2017年 李鹏. All rights reserved.
//

import UIKit

class LPImageTitleView: UIView {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var title: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    class func imageTitleView() -> LPImageTitleView {
        return Bundle.main.loadNibNamed(String(describing: self), owner: nil, options: nil)?.last as! LPImageTitleView
    }
    
    func config(images: String, titles: String) {
        imageView.setImage(images, "")
        title.text = titles
    }
    
}
