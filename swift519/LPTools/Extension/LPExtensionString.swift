//
//  LPExtensionString.swift
//  swift519
//
//  Created by 李鹏 on 2017/7/21.
//  Copyright © 2017年 李鹏. All rights reserved.
//

import Foundation


extension String {
    
    func lpIsRegex(_ regex: String) -> Bool {
        
        let regExPredicate: NSPredicate = NSPredicate(format: "SELF MATCHES %@", regex)
        
        return regExPredicate.evaluate(with: self.lowercased())
    }
    
    /// 密码匹配6-18位数字或字母
    var checkPassword: Bool { return lpIsRegex("^[a-zA-Z0-9]{6,18}") }
    
    /// 密码匹配6-18位数字和字母组合
    var checkPasswordMix: Bool { return lpIsRegex("^(?![0-9]+$)(?![a-zA-Z]+$)[a-zA-Z0-9]{6,18}") }
    
    /// 用户名匹配1-20位字母或中文组合
    var checkUserName: Bool { return lpIsRegex("^[a-zA-Z\\u4E00-\\u9FA5]{1,20}") }
    
    /// 身份证
    var checkUserIdCard: Bool { return lpIsRegex("(^[0-9]{15}$)|([0-9]{17}([0-9]|X)$)") }
    
    /// 手机号
    var checkTelNumber: Bool { return lpIsRegex("^1+[3578]+\\d{9}") }
    
    /// 邮箱
    var checkEmailAddress: Bool { return lpIsRegex("[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}") }
    
    func md5String() -> String {
        let str = self.cString(using: String.Encoding.utf8)
        let strLen = CUnsignedInt(self.lengthOfBytes(using: String.Encoding.utf8))
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: digestLen)
        CC_MD5(str!, strLen, result)
        let hash = NSMutableString()
        for i in 0 ..< digestLen {
            hash.appendFormat("%02x", result[i])
        }
        result.deinitialize()
        
        return String(format: hash as String)
    }
    
    func base64EncodedString() -> String {
        let data = self.data(using: Encoding.utf8)
        let string = data?.base64EncodedString(options: Data.Base64EncodingOptions(rawValue: 0))
        return string!
    }
    
    func base64DecodedString() -> String {
        let decodedData = NSData(base64Encoded: self, options: NSData.Base64DecodingOptions.init(rawValue: 0))
        let decodedString = NSString(data: decodedData! as Data, encoding: String.Encoding.utf8.rawValue)
       return decodedString! as String
    }
}
