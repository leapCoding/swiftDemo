//
//  LPHomeViewController.swift
//  swift519
//
//  Created by 李鹏 on 2017/7/14.
//  Copyright © 2017年 李鹏. All rights reserved.
//

import UIKit

class LPHomeViewController: LPBaseViewController {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var headView: UIView!
    @IBOutlet var adScrollView: WRCycleScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
        // Do any additional setup after loading the view.
    }
    
    func configUI() {
        headView.backgroundColor = UIColor.red
        adScrollView.serverImgArray = ["http://api.mall519.com/Files/Pics/Ads/Home/ad1.jpg?t=111","http://api.mall519.com/Files/Pics/Ads/Home/ad2.jpg?t=111"]
//        headView.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenWidth * 150 / 320);
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
