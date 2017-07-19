//
//  LPHomeModel.swift
//  swift519
//
//  Created by 李鹏 on 2017/7/17.
//  Copyright © 2017年 李鹏. All rights reserved.
//

import UIKit
import HandyJSON

class LPHomeModel: HandyJSON {
    var characteristics : String?
    var brands : [HomeBrands]?
    var ads : [HomeAds]?
    var recommends : [HomeRecommends]?
    var recommendAds : [HomeRecommendAds]?
    
    required init() {}
}

class HomeBrands: HandyJSON {
    var brandId : String?
    var name : String?
    var pic : String?
    required init() {}
}

class HomeAds: HandyJSON {
    var pic : String?
    required init() {}
}

class HomeRecommendAds: HandyJSON {
    var pic : String?
    var position : Int = -1
    required init() {}
}

class HomeRecommends: HandyJSON {
    var pic : String?
    var name : String?
    var price : String?
    var marketPrice : String?
    var goodRate : String?
    var appraiseCount : String?
    
    required init() {}
}
