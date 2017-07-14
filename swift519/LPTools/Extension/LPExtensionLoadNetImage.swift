//
//  LPExtensionLoadNetImage.swift
//  swift519
//
//  Created by 李鹏 on 2017/7/14.
//  Copyright © 2017年 李鹏. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    func setImage(_ urlString : String? , _ placeHolderName : String?) {
        guard let urlString = urlString else {
            return
        }
        guard let placeHolderName = placeHolderName else {
            return
        }
        
        guard let url = URL(string: urlString) else {
            return
        }
        kf.setImage(with: url, placeholder: UIImage.init(named: placeHolderName))
    }
    
}
