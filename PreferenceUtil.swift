//
//  PreferenceUtil.swift
//
//  Created by thcomp on 10/6/15.
//  Copyright (c) 2015 thcomp. All rights reserved.
//

import Foundation

public class PreferenceUtil{
    private static var UserDefaultsMap: [String:NSUserDefaults] = [String:NSUserDefaults]();
    private static let sSemaphore: Semaphore = Semaphore();

    private static func getUserDefaults(suiteName: String?)->NSUserDefaults{
        var ret: NSUserDefaults? = nil;
    
        sSemaphore.lock();
        if suiteName != nil && suiteName != "" {
            ret = UserDefaultsMap[suiteName!];
            if ret == nil {
                ret = NSUserDefaults.init(suiteName: suiteName);
                UserDefaultsMap[suiteName!] = ret;
            }
        }else{
            ret = NSUserDefaults.standardUserDefaults();
        }
        sSemaphore.unlock();
    
        return ret!;
    }
    
    public static func writePref(prefName: String?, key: String, stringValue: String?){
        let userDefaults: NSUserDefaults = getUserDefaults(prefName);
        if let unwrappedValue: String = stringValue {
            userDefaults.setObject(unwrappedValue, forKey: key);
        }else{
            userDefaults.removeObjectForKey(key);
        }
        userDefaults.synchronize();
    }
    
    public static func writePref(prefName: String?, key: String, stringValues: [String]?){
        let userDefaults: NSUserDefaults = getUserDefaults(prefName);
        if let unwrappedValue: [String] = stringValues {
            userDefaults.setObject(unwrappedValue, forKey: key);
        } else {
            userDefaults.removeObjectForKey(key);
        }
        userDefaults.synchronize();
    }
    
    public static func writePref(prefName: String?, key: String, intValue: Int){
        let userDefaults: NSUserDefaults = getUserDefaults(prefName);
        userDefaults.setInteger(intValue, forKey: key);
        userDefaults.synchronize();
    }
    
    public static func writePref(prefName: String?, key: String, intValues: [Int]){
        let userDefaults: NSUserDefaults = getUserDefaults(prefName);
        userDefaults.setObject(intValues, forKey: key);
        userDefaults.synchronize();
    }
    
    public static func writePref(prefName: String?, key: String, int64Value: Int64){
        let userDefaults: NSUserDefaults = getUserDefaults(prefName);
        let numberValue: NSNumber = NSNumber(longLong: int64Value);
        userDefaults.setObject(numberValue, forKey: key);
        userDefaults.synchronize();
    }
    
    public static func writePref(prefName: String?, key: String, int64Values: [Int64]){
        let userDefaults: NSUserDefaults = getUserDefaults(prefName);
        var numberValues: [NSNumber] = [NSNumber]();

        for var int64Value in int64Values {
            numberValues.append(NSNumber(longLong: int64Value));
        }

        userDefaults.setObject(numberValues, forKey: key);
        userDefaults.synchronize();
    }
    
    public static func writePref(prefName: String?, key: String, floatValue: Float){
        let userDefaults: NSUserDefaults = getUserDefaults(prefName);
        userDefaults.setFloat(floatValue, forKey: key);
        userDefaults.synchronize();
    }
    
    public static func writePref(prefName: String?, key: String, floatValues: [Float]){
        let userDefaults: NSUserDefaults = getUserDefaults(prefName);
        if let unwrappedValue: [Float] = floatValues {
            userDefaults.setObject(unwrappedValue, forKey: key);
        }else{
            userDefaults.removeObjectForKey(key);
        }
        userDefaults.synchronize();
    }
    
    public static func writePref(prefName: String?, key: String, doubleValue: Double){
        let userDefaults: NSUserDefaults = getUserDefaults(prefName);
        userDefaults.setDouble(doubleValue, forKey: key);
        userDefaults.synchronize();
    }
    
    public static func writePref(prefName: String?, key: String, doubleValues: [Double]){
        let userDefaults: NSUserDefaults = getUserDefaults(prefName);
        if let unwrappedValue: [Double] = doubleValues {
            userDefaults.setObject(unwrappedValue, forKey: key);
        }else{
            userDefaults.removeObjectForKey(key);
        }
        userDefaults.synchronize();
    }
    
    public static func writePref(prefName: String?, key: String, boolValue: Bool){
        let userDefaults: NSUserDefaults = getUserDefaults(prefName);
        userDefaults.setBool(boolValue, forKey: key);
        userDefaults.synchronize();
    }
    
    public static func writePref(prefName: String?, key: String, boolValues: [Bool]){
        let userDefaults: NSUserDefaults = getUserDefaults(prefName);
        if let unwrappedValue: [Bool] = boolValues {
            userDefaults.setObject(unwrappedValue, forKey: key);
        }else{
            userDefaults.removeObjectForKey(key);
        }
        userDefaults.synchronize();
    }
    
    public static func writePref(prefName: String?, key: String, urlValue: NSURL){
        let userDefaults: NSUserDefaults = getUserDefaults(prefName);
        if let unwrappedValue: NSURL = urlValue {
            userDefaults.setURL(unwrappedValue, forKey: key);
        }else{
            userDefaults.removeObjectForKey(key);
        }
        userDefaults.synchronize();
    }
    
    public static func writePref(prefName: String?, key: String, urlValues: [NSURL]){
        let userDefaults: NSUserDefaults = getUserDefaults(prefName);
        if let unwrappedValue: [NSURL] = urlValues {
            userDefaults.setObject(unwrappedValue, forKey: key);
        }else{
            userDefaults.removeObjectForKey(key);
        }
        userDefaults.synchronize();
    }
    
    public static func writePref(prefName: String?, key: String, dataValue: NSData){
        let userDefaults: NSUserDefaults = getUserDefaults(prefName);
        if let unwrappedValue: NSData = dataValue {
            userDefaults.setObject(unwrappedValue, forKey: key);
        }else{
            userDefaults.removeObjectForKey(key);
        }
        userDefaults.synchronize();
    }
    
    public static func writePref(prefName: String?, key: String, dataValues: [NSData]){
        let userDefaults: NSUserDefaults = getUserDefaults(prefName);
        if let unwrappedValue: [NSData] = dataValues {
            userDefaults.setObject(unwrappedValue, forKey: key);
        }else{
            userDefaults.removeObjectForKey(key);
        }
        userDefaults.synchronize();
    }
    
    public static func writePref(key: String, stringValue: String){
        writePref(nil, key: key, stringValue: stringValue);
    }
    
    public static func writePref(key: String, stringValues: [String]){
        writePref(nil, key: key, stringValues: stringValues);
    }
    
    public static func writePref(key: String, intValue: Int){
        writePref(nil, key: key, intValue: intValue);
    }
    
    public static func writePref(key: String, intValues: [Int]){
        writePref(nil, key: key, intValues: intValues);
    }
    
    public static func writePref(key: String, floatValue: Float){
        writePref(nil, key: key, floatValue: floatValue);
   }
    
    public static func writePref(key: String, floatValues: [Float]){
        writePref(nil, key: key, floatValues: floatValues);
    }
    
    public static func writePref(key: String, doubleValue: Double){
        writePref(nil, key: key, doubleValue: doubleValue);
    }
    
    public static func writePref(key: String, doubleValues: [Double]){
        writePref(nil, key: key, doubleValues: doubleValues);
    }
    
    public static func writePref(key: String, boolValue: Bool){
        writePref(nil, key: key, boolValue: boolValue);
    }
    
    public static func writePref(key: String, boolValues: [Bool]){
        writePref(nil, key: key, boolValues: boolValues);
    }
    
    public static func writePref(key: String, urlValue: NSURL){
        writePref(nil, key: key, urlValue: urlValue);
    }
    
    public static func writePref(key: String, urlValues: [NSURL]){
        writePref(nil, key: key, urlValues: urlValues);
    }
    
    public static func writePref(key: String, dataValue: NSData){
        writePref(nil, key: key, dataValue: dataValue);
    }
    
    public static func writePref(key: String, dataValues: [NSData]){
        writePref(nil, key: key, dataValues: dataValues);
    }
    
    public static func readPrefString(prefName: String?, key: String, defaultValue: String?)->String?{
        let userDefaults: NSUserDefaults = getUserDefaults(prefName);
        var ret: String? = userDefaults.stringForKey(key);
        if ret == nil {
            ret = defaultValue;
        }
        return ret;
    }
    
    public static func readPrefStringArray(prefName: String?, key: String, defaultValue: [String]?)->[String]?{
        let userDefaults: NSUserDefaults = getUserDefaults(prefName);
        var ret: [String]? = userDefaults.stringArrayForKey(key);
        if ret == nil{
            ret = defaultValue;
        }
        return ret;
    }
    
    public static func readPrefInt(prefName: String?, key: String, defaultValue: Int)->Int{
        let userDefaults: NSUserDefaults = getUserDefaults(prefName);
        var ret: Int? = userDefaults.integerForKey(key);
        if ret == nil {
            ret = defaultValue;
        }
        return ret!;
    }
    
    public static func readPrefIntArray(prefName: String?, key: String, defaultValue: [Int]?)->[Int]?{
        let userDefaults: NSUserDefaults = getUserDefaults(prefName);
        var ret: [Int]? = userDefaults.arrayForKey(key) as! [Int]?;
        if ret == nil {
            ret = defaultValue;
        }
        return ret;
    }
    
    public static func readPrefInt64(prefName: String?, key: String, defaultValue: Int64)->Int64{
        let userDefaults: NSUserDefaults = getUserDefaults(prefName);
        var ret: Int64 = defaultValue;
        let tempRet: AnyObject? = userDefaults.objectForKey(key);
        
        if tempRet != nil {
            ret = (tempRet as! NSNumber).longLongValue;
        }

        return ret;
    }
    
    public static func readPrefInt64Array(prefName: String?, key: String, defaultValue: [Int64]?)->[Int64]?{
        let userDefaults: NSUserDefaults = getUserDefaults(prefName);
        var ret: [Int64]? = defaultValue;
        let tempRet: [AnyObject]? = userDefaults.arrayForKey(key);
        
        if tempRet != nil {
            ret = [Int64]();
            for var value: AnyObject in tempRet! {
                ret?.append((value as! NSNumber).longLongValue);
            }
        }
        return ret;
    }
    
    public static func readPrefFloat(prefName: String?, key: String, defaultValue: Float?)->Float?{
        let userDefaults: NSUserDefaults = getUserDefaults(prefName);
        var ret: Float? = userDefaults.floatForKey(key);
        if ret == nil {
            ret = defaultValue;
        }
        return ret;
    }
    
    public static func readPrefFloatArray(prefName: String?, key: String, defaultValue: [Float]?)->[Float]?{
        let userDefaults: NSUserDefaults = getUserDefaults(prefName);
        var ret: [Float]? = userDefaults.arrayForKey(key) as! [Float]?;
        if ret == nil {
            ret = defaultValue;
        }
        return ret;
    }
    
    public static func readPrefDouble(prefName: String?, key: String, defaultValue: Double?)->Double?{
        let userDefaults: NSUserDefaults = getUserDefaults(prefName);
        var ret: Double? = userDefaults.doubleForKey(key);
        if ret == nil {
            ret = defaultValue;
        }
        return ret;
    }
    
    public static func readPrefDoubleArray(prefName: String?, key: String, defaultValue: [Double]?)->[Double]?{
        let userDefaults: NSUserDefaults = getUserDefaults(prefName);
        var ret: [Double]? = userDefaults.objectForKey(key) as! [Double]?;
        if ret == nil {
            ret = defaultValue;
        }
        return ret;
    }
    
    public static func readPrefBool(prefName: String?, key: String, defaultValue: Bool?)->Bool?{
        let userDefaults: NSUserDefaults = getUserDefaults(prefName);
        var ret: Bool? = userDefaults.boolForKey(key);
        if ret == nil {
            ret = defaultValue;
        }
        return ret;
    }
    
    public static func readPrefBoolArray(prefName: String?, key: String, defaultValue: [Bool]?)->[Bool]?{
        let userDefaults: NSUserDefaults = getUserDefaults(prefName);
        var ret: [Bool]? = userDefaults.objectForKey(key) as! [Bool]?;
        if ret == nil {
            ret = defaultValue;
        }
        return ret;
    }
    
    public static func readPrefURL(prefName: String?, key: String, defaultValue: NSURL?)->NSURL?{
        let userDefaults: NSUserDefaults = getUserDefaults(prefName);
        var ret: NSURL? = userDefaults.URLForKey(key);
        if ret == nil {
            ret = defaultValue;
        }
        return ret;
    }
    
    public static func readPrefURLArray(prefName: String?, key: String, defaultValue: [NSURL]?)->[NSURL]?{
        let userDefaults: NSUserDefaults = getUserDefaults(prefName);
        var ret: [NSURL]? = userDefaults.arrayForKey(key) as! [NSURL]?;
        if ret == nil {
            ret = defaultValue;
        }
        return ret;
    }
    
    public static func readPrefData(prefName: String?, key: String, defaultValue: NSData?)->NSData?{
        let userDefaults: NSUserDefaults = getUserDefaults(prefName);
        var ret: NSData? = userDefaults.dataForKey(key);
        if ret == nil {
            ret = defaultValue;
        }
        return ret;
    }
    
    public static func readPrefDataArray(prefName: String?, key: String, defaultValue: [NSData]?)->[NSData]?{
        let userDefaults: NSUserDefaults = getUserDefaults(prefName);
        var ret: [NSData]? = userDefaults.arrayForKey(key) as! [NSData]?;
        if ret == nil {
            ret = defaultValue;
        }
        return ret;
    }
    
    public static func readPrefString(key: String, defaultValue: String)->String?{
        return readPrefString(nil, key: key, defaultValue: defaultValue);
    }
    
    public static func readPrefStringArray(key: String, defaultValue: [String]?)->[String]?{
        return readPrefStringArray(nil, key: key, defaultValue: defaultValue);
    }
    
    public static func readPrefInt(key: String, defaultValue: Int)->Int?{
        return readPrefInt(nil, key: key, defaultValue: defaultValue);
    }
    
    public static func readPrefIntArray(key: String, defaultValue: [Int]?)->[Int]?{
        return readPrefIntArray(nil, key: key, defaultValue: defaultValue);
    }
    
    public static func readPrefInt64(key: String, defaultValue: Int64)->Int64{
        return readPrefInt64(nil, key: key, defaultValue: defaultValue);
    }
    
    public static func readPrefInt64Array(key: String, defaultValue: [Int64]?)->[Int64]?{
        return readPrefInt64Array(nil, key: key, defaultValue: defaultValue);
    }
    
    public static func readPrefFloat(key: String, defaultValue: Float?)->Float?{
        return readPrefFloat(nil, key: key, defaultValue: defaultValue);
    }
    
    public static func readPrefFloatArray(key: String, defaultValue: [Float]?)->[Float]?{
        return readPrefFloatArray(nil, key: key, defaultValue: defaultValue);
    }
    
    public static func readPrefDouble(key: String, defaultValue: Double?)->Double?{
        return readPrefDouble(nil, key: key, defaultValue: defaultValue);
    }
    
    public static func readPrefDoubleArray(key: String, defaultValue: [Double]?)->[Double]?{
        return readPrefDoubleArray(nil, key: key, defaultValue: defaultValue);
    }
    
    public static func readPrefBool(key: String, defaultValue: Bool?)->Bool?{
        return readPrefBool(nil, key: key, defaultValue: defaultValue);
    }
    
    public static func readPrefBoolArray(key: String, defaultValue: [Bool]?)->[Bool]?{
        return readPrefBoolArray(nil, key: key, defaultValue: defaultValue);
    }
    
    public static func readPrefURL(key: String, defaultValue: NSURL?)->NSURL?{
        return readPrefURL(nil, key: key, defaultValue: defaultValue);
    }
    
    public static func readPrefURLArray(key: String, defaultValue: [NSURL]?)->[NSURL]?{
        return readPrefURLArray(nil, key: key, defaultValue: defaultValue);
    }
    
    public static func readPrefData(key: String, defaultValue: NSData?)->NSData?{
        return readPrefData(nil, key: key, defaultValue: defaultValue);
    }
    
    public static func readPrefDataArray(key: String, defaultValue: [NSData]?)->[NSData]?{
        return readPrefDataArray(nil, key: key, defaultValue: defaultValue);
    }
}
