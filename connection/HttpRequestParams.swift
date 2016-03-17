//
//  HttpRequestParams.swift
//
//  Created by thcomp on 2016/02/25.
//  Copyright © 2016年 thcomp. All rights reserved.
//

import Foundation

public class HttpRequestParams{
    public enum MethodType: String{
        case GET = "GET"
        case POST = "POST"
        case PUT = "PUT"
        case DELETE = "DELETE"
    }
    
    public var methodType: MethodType = MethodType.GET;
    public var uri: NSURL?;
    public var requestHeaders: [String: String]?;
    public var callback: HttpConnectionCallback?;
    public var userData: NSData?;
    private var mRedirect: Bool = false;
    
    public func setInstanceFollowRedirects(redirect: Bool){
        mRedirect = redirect;
    }
}

