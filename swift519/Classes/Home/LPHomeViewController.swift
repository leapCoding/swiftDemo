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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    fileprivate lazy var home: LPHomeModel = {
        let home = LPHomeModel()
        return home
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        homeData()
        
        configUI()
        // Do any additional setup after loading the view.
        let test = LPTestObject()
        test.testMethod()
        if let md5: String = "123456".md5String() {
            print(md5)
        }else {
            print("-----------no")
        }
    }
    
    func configUI() {
        headView.backgroundColor = UIColor.red
        adScrollView.bottomViewBackgroundColor = UIColor.white
        self.view.backgroundColor = UIColor.colorWithRGBHex(hex: 0xf5f5f5)
        tableView.backgroundColor = UIColor.colorWithRGBHex(hex: 0xf5f5f5)
    
        tableView.register(LPRemmendAdCell.loadNib(), forCellReuseIdentifier: LPRemmendAdCell.stringName())
        tableView.register(LPRecommendGoodCell.loadNib(), forCellReuseIdentifier: LPRecommendGoodCell.stringName())
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
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: LPHomeBrandCell.stringName(), for: indexPath) as! LPHomeBrandCell
            cell.configUI(itmes: self.home.brands)
            return cell
        }else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: LPRemmendAdCell.stringName(), for: indexPath) as! LPRemmendAdCell
            cell.configData(home: home)
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: LPRecommendGoodCell.stringName(), for: indexPath) as! LPRecommendGoodCell
            cell.configData(items: home.recommends)
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return LPHomeBrandCell.cellHeight(itmes: home.brands)
        }else if indexPath.section == 1 {
            return kScreenWidth * 200 / 320
        }else {
            return LPRecommendGoodCell.cellHeight(items: home.recommends)
        }
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    
}
