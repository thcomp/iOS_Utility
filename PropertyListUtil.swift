//
//  PropertyListUtil.swift
//
//  Created by thcomp on 10/16/15.
//  Copyright © 2015 thcomp. All rights reserved.
//

import Foundation

public class PropertyListUtil{
    public static func readPropertyList(plistFileName: String) -> NSDictionary?{
        var ret: NSDictionary?;
        let plistPath: String = getAbsolutePath(plistFileName);

        if plistPath.characters.count > 0{
            ret = NSDictionary(contentsOfFile: plistPath);
        }

        return ret;
    }

    public static func readDefaultPropertyList(plistFileName: String) -> NSDictionary?{
        var ret: NSDictionary?;
        let bundle: NSBundle = NSBundle.mainBundle();
        let path: String? = bundle.pathForResource(plistFileName, ofType: "plist");
        
        if let unwrappedPath: String = path {
            ret = NSDictionary(contentsOfFile: unwrappedPath);
        }

        return ret;
    }
    
    private static func getAbsolutePath(plistFileName: String) -> String {
        var path: String = "";
        let parentPaths: [String] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true) as [String];
        
        if parentPaths.count > 0 {
            path = parentPaths[0] + "/" + plistFileName;
        }
        
        return path;
    }
    
    
    private static func getBundle(plistFileName: String) -> String {
        var path: String = "";
        let parentPaths: [String] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true) as [String];
        
        if parentPaths.count > 0 {
            path = parentPaths[0] + "/" + plistFileName;
        }
        
        return path;
    }
}