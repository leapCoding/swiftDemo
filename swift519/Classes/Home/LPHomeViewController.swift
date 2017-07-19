//
//  LPHomeViewController.swift
//  swift519
//
//  Created by 李鹏 on 2017/7/14.
//  Copyright © 2017年 李鹏. All rights reserved.
//

import UIKit
import HandyJSON

class LPHomeViewController: LPBaseViewController, UITableViewDelegate,UITableViewDataSource{

    @IBOutlet var tableView: UITableView!
    @IBOutlet var headView: UIView!
    @IBOutlet var adScrollView: WRCycleScrollView!
    @IBOutlet var brandCell: UITableViewCell!
    
    fileprivate lazy var home: LPHomeModel = {
        let home = LPHomeModel()
        return home
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        homeData()
        
        configUI()
        // Do any additional setup after loading the view.
    }
    
    func configUI() {
        headView.backgroundColor = UIColor.red
        adScrollView.bottomViewBackgroundColor = UIColor.white
        tableView.backgroundColor = UIColor.colorWithRGBHex(hex: 0xf5f5f5)
        
//        tableView.register(LPHomeBrandCell.loadNib(), forCellReuseIdentifier: "LPHomeBrandCell")
        tableView.register(UINib.init(nibName: "LPRemmendAdCell", bundle: nil), forCellReuseIdentifier: "LPRemmendAdCell")
    }
    
    func homeData() {
        LPNetWork.lp_get(url: "http://api.mall519.com/api/Index/Home", paramers: nil, modelClass: LPHomeModel()) { (isSuccess, response ) in
            print(response.data)
            self.home = response.resultModel as! LPHomeModel
            let images : NSMutableArray = []
            for ads:HomeAds in self.home.ads! {
                images.add(ads.pic ?? "")
            }
            self.adScrollView.serverImgArray = images as? [String]
            self.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LPHomeBrandCell", for: indexPath) as! LPHomeBrandCell
            cell.configUI(itmes: self.home.brands)
            return cell
        }else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LPRemmendAdCell", for: indexPath) as! LPRemmendAdCell
            cell.configData(home: home)
            return cell
        }else {
            return UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return LPHomeBrandCell.cellHeight(itmes: home.brands)
        }else if indexPath.section == 1 {
            return 100
        }else {
            return 10
        }
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0 {
            return 10
        }else {
            return 0.1
        }
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
