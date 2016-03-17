//
//  JSONData.swift
//
//  Created by thcomp on 9/6/15.
//  Copyright (c) 2015 thcomp. All rights reserved.
//

import Foundation

public class JSONData{
    private var mJSONData: [String: AnyObject];
    
    public init(){
        mJSONData = [String: AnyObject]();
    }
    
    public init(jsonData: NSData){
        mJSONData = (try! NSJSONSerialization.JSONObjectWithData(jsonData, options: [])) as! [String: AnyObject];
    }
    
    public func set(key: String, value: AnyObject?){
        mJSONData[key] = value;
    }
    
    public func set(key: String, jsonValue: JSONData?){
        if let jsonData: JSONData = jsonValue {
            mJSONData[key] = jsonData.mJSONData;
        }
    }
    
    public func remove(key: String){
        mJSONData.removeValueForKey(key);
    }

    public func getData()->NSData?{
        return try? NSJSONSerialization.dataWithJSONObject(mJSONData, options: NSJSONWritingOptions());
    }
    
    public func getChildCount()->Int {
        return mJSONData.count;
    }
    
    public func getChild(index: Int)->JSONData{
        let ret: JSONData = JSONData();
        
        if mJSONData.count > index {
            let baseIndex = mJSONData.keys.startIndex.advancedBy(index);
            ret.set(mJSONData.keys[baseIndex], value: mJSONData.values[baseIndex]);
        }
        
        return ret;
    }
    
    public func getKey(var index: Int) -> String? {
        var key: String? = nil;
        
        if index >= 0 && index < mJSONData.count {
            for tempKey in mJSONData.keys {
                if index == 0 {
                    key = tempKey;
                    break;
                }
                
                index--;
            }
        }
        
        return key;
    }
    
    public func getValue(var index: Int) -> AnyObject? {
        var value: AnyObject? = nil;
        
        if index >= 0 && index < mJSONData.count {
            for tempValue in mJSONData.values {
                if index == 0 {
                    value = tempValue;
                    break;
                }
                
                index--;
            }
        }
        
        return value;
    }
    
    public func optString(key: String) -> String? {
        let childData: AnyObject? = mJSONData[key];
        var ret: String? = nil;

        if childData != nil {
            if let stringValue: String = childData as? String {
                ret = stringValue;
            }
        }
        
        return ret;
    }
    
    public func optInt(key: String) -> Int? {
        let childData: AnyObject? = mJSONData[key];
        var ret: Int? = nil;
        
        if childData != nil {
            if let intValue: Int = childData as? Int {
                ret = intValue;
            }
        }
        
        return ret;
    }
    
    public func optInt64(key: String) -> Int64? {
        let childData: AnyObject? = mJSONData[key];
        var ret: Int64? = nil;
        
        if childData != nil {
            if let int64Value: Int64 = childData as? Int64 {
                ret = int64Value;
            }
        }
        
        return ret;
    }
    
    public func optJSONData(key: String) -> JSONData? {
        let childData: AnyObject? = mJSONData[key];
        var ret: JSONData? = nil;
        
        if childData != nil {
            if let dataValue: JSONData = childData as? JSONData {
                ret = dataValue;
            }
        }
        
        return ret;
    }
    
    public func optJSONArray(key: String) -> [JSONData]? {
        let childData: AnyObject? = mJSONData[key];
        var ret: [JSONData]? = nil;
        
        if childData != nil {
            if let dataValues: [JSONData] = childData as? [JSONData] {
                ret = dataValues;
            }
        }
        
        return ret;
    }
}

