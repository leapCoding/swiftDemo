//
//  LPTabBarViewController.swift
//  swift519
//
//  Created by 李鹏 on 2017/7/13.
//  Copyright © 2017年 李鹏. All rights reserved.
//

import UIKit

class LPTabBarViewController: UITabBarController {
    
    let normalImages : [NSString] = ["icon_menuHome01","icon_menuNews01","icon_menuOrder01","icon_menuMy01"]
    let selectedImages : [NSString] = ["icon_menuHome02","icon_menuNews02","icon_menuOrder02","icon_menuMy02"]
    let titles : [NSString] = ["首页","消息","订单","我的"];
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        tabbarItemAttributes()
    }
    
    func tabbarItemAttributes() {
        UITabBarItem.appearance().setTitleTextAttributes([NSFontAttributeName:UIFont.systemFont(ofSize: 12),NSForegroundColorAttributeName:UIColor.colorWithRGBHex(hex: 0x333333)], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSFontAttributeName:UIFont.systemFont(ofSize: 12),NSForegroundColorAttributeName:UIColor.colorWithRGBHex(hex: 0xd43d4e)], for: .selected)
        
        let items = self.tabBar.items
        
        for (index, value) in (items?.enumerated())! {
            let normalImage = UIImage.init(named: normalImages[index] as String)?.withRenderingMode(.alwaysOriginal)
            let selectedImage = UIImage.init(named: selectedImages[index] as String)?.withRenderingMode(.alwaysOriginal)
            value.image = normalImage
            value.selectedImage = selectedImage
            value.title = titles[index] as String
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
