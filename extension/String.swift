//
//  String.swift
//  TwilioPhone
//
//  Created by thcomp on 11/5/15.
//  Copyright © 2015 thcomp. All rights reserved.
//

import Foundation

extension String{
    func md5()->String {
        let cStr = self.cStringUsingEncoding(NSUTF8StringEncoding);
        let data = NSData(bytes: cStr!, length: self.lengthOfBytesUsingEncoding(NSUTF8StringEncoding));
        
        var digest = [UInt8](count: Int(CC_MD5_DIGEST_LENGTH), repeatedValue: 0);
        CC_MD5(data.bytes, CC_LONG(data.length), &digest);
        
        return changeToString(digest);
    }
    
    func sha256()->String {
        let cStr = self.cStringUsingEncoding(NSUTF8StringEncoding);
        let data = NSData(bytes: cStr!, length: self.lengthOfBytesUsingEncoding(NSUTF8StringEncoding));
        
        var digest = [UInt8](count: Int(CC_SHA256_DIGEST_LENGTH), repeatedValue: 0);
        CC_SHA256(data.bytes, CC_LONG(data.length), &digest);
        
        return changeToString(digest);
    }
    
    func sha512()->String {
        let cStr = self.cStringUsingEncoding(NSUTF8StringEncoding);
        let data = NSData(bytes: cStr!, length: self.lengthOfBytesUsingEncoding(NSUTF8StringEncoding));
        
        var digest = [UInt8](count: Int(CC_SHA512_DIGEST_LENGTH), repeatedValue: 0);
        CC_SHA512(data.bytes, CC_LONG(data.length), &digest);
        
        return changeToString(digest);
    }

    private func changeToString(digestData: [UInt8]) -> String {
        var ret = NSMutableString(capacity: digestData.count * 2);

        for var byte: UInt8 in digestData {
            ret.appendFormat("%02X", byte);
        }
        
        return ret as String;
    }
}