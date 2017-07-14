//
//  LPNetWorkManager.swift
//  swift519
//
//  Created by 李鹏 on 2017/7/14.
//  Copyright © 2017年 李鹏. All rights reserved.
//

import UIKit
import Alamofire

public class LPNetModel : NSObject {
    
    public var paramers : [String:Any]?
    public var url : String!
    public var dataClass : AnyClass?
    public var mapclass : AnyClass?
    public var headers : HTTPHeaders?
    
    public init(para:[String:Any]?, data:AnyClass?, map:AnyClass?, urlString:String, header:HTTPHeaders?) {
        super.init()
        paramers = para
        dataClass = data
        mapclass = map
        url = urlString
        headers = header
    }
}

public typealias SuccessClosure = (Bool,Any) -> ()
public typealias FailClosure = (Bool,Any) -> ()

public class LPNetWork : NSObject {
    
    /**
     *  GET请求
     * - Parameters:
     *   - netModel: 参数配置Model
     *   - success: 成功回调
     *   - fail: 失败回调
     */
//    public class func GET(netModel:LPNetWork, success@escaping SuccessClosure, fail:@escaping FailClosure) {
//        
//    }
}
