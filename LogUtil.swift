//
//  LogUtil.swift
//
//  Created by thcomp on 8/23/15.
//  Copyright (c) 2015 thcomp. All rights reserved.
//

import Foundation

public class LogUtil{
    public static let LogLevelError: Int = 1;
    public static let LogLevelWarning: Int = 2;
    public static let LogLevelInfo: Int = 4;
    public static let LogLevelDebug: Int = 8;
    public static let LogLevelVerbose: Int = 16;
    public static let LogLevelBitmap: Int = 32;
    public static let LogLevelStackTrace: Int = 64;
    
    private static var sLogLevel: Int = LogLevelError | LogLevelWarning | LogLevelInfo;
    
    public static func setLogLevel(logLevel: Int){
        sLogLevel = logLevel;
    }
    
    public static func addLogLevel(logLevel: Int){
        sLogLevel |= logLevel;
    }
    
    public static func removeLogLevel(logLevel: Int){
        sLogLevel &= (~logLevel);
    }
    
    public static func e(tag: String, content: String){
        if((sLogLevel & LogLevelError) == LogLevelError){
            print(tag + " : " + content);
        }
    }
    
    public static func w(tag: String, content: String){
        if((sLogLevel & LogLevelWarning) == LogLevelWarning){
            print(tag + " : " + content);
        }
    }
    
    public static func i(tag: String, content: String){
        if((sLogLevel & LogLevelInfo) == LogLevelInfo){
            print(tag + " : " + content);
        }
    }
    
    public static func d(tag: String, content: String){
        if((sLogLevel & LogLevelDebug) == LogLevelDebug){
            print(tag + " : " + content);
        }
    }
    
    public static func v(tag: String, content: String){
        if((sLogLevel & LogLevelVerbose) == LogLevelVerbose){
            print(tag + " : " + content);
        }
    }
    
    public static func printStackTrace(){
        if((sLogLevel & LogLevelStackTrace) == LogLevelStackTrace){
            print(NSThread.callStackSymbols());
        }
    }
}