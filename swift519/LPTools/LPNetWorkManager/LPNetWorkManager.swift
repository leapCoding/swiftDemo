//
//  LPNetWorkManager.swift
//  swift519
//
//  Created by 李鹏 on 2017/7/14.
//  Copyright © 2017年 李鹏. All rights reserved.
//

import UIKit
import Alamofire
//import SwiftyJSON
import HandyJSON

public class LPNetModel : NSObject {
    
    public var paramers : [String:Any]?
    public var url : String!
    public var headers : HTTPHeaders?
    
    public init<T:HandyJSON>(para:[String:Any]?, data:T, urlString:String) {
        super.init()
        paramers = para
        url = urlString
        let header = ["Authorization":"Basic ","memberId":"","X-Message-Sender":"529MALL","FromAPP":"1","PlatformType":"2","AppVersion":"1.0.0"]
        headers = header
    }
}

public typealias ResultCallBack = (Bool,LPNetWorkResponse) -> ()

public class LPNetWork : NSObject {
    
    /**
     *  GET请求
     * - Parameters:
     *   - netModel: 参数配置Model
     *   - success: 成功回调
     *   - fail: 失败回调
     */
    public class func lp_get<T:HandyJSON>(url: String!, paramers: [String: Any]?, modelClass:T, resultCallBack:@escaping ResultCallBack) {
        let header = ["Authorization":"Basic ","memberId":"","X-Message-Sender":"529MALL","FromAPP":"1","PlatformType":"2","AppVersion":"1.0.0"]
        Alamofire.request(url, method: .get, parameters: paramers, encoding: URLEncoding.default, headers: header).responseJSON { (response) in
            if response.result.isSuccess {
                let res = LPNetWorkResponse.init(jsonData: response.result.value, classs: T())
                resultCallBack(true, res)
            }
        }
    }
    
}

public class LPNetWorkResponse : NSObject {
    
    public var message : String = ""
    public var code : Int = 0
    public var data : Dictionary<String, Any> = [:]
    public var resultModel : Any?
    
    public init<T:HandyJSON>(jsonData:Any?, classs: T) {
        
        if let jsonDic: Dictionary<String, Any> = jsonData as? Dictionary<String, Any> {
            
            if let tempCode = jsonDic["code"] as? Int {
                code = tempCode
            }
            if let tempMessage = jsonDic["message"] as? String {
                message = tempMessage
            }
            if let tempData = jsonDic["data"] as? Dictionary<String, Any> {
                data = tempData
            }
            let rootmodel = JSONDeserializer<T>.deserializeFrom(dict: data as NSDictionary)
            if (rootmodel != nil) {
                resultModel = rootmodel
            }
        }else {
            print("sss")
        }
    }
}

struct LPRootModel: HandyJSON {
    var key :String?
}
