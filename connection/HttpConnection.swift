//
//  HttpConnection.swift
//
//  Created by thcomp on 8/30/15.
//  Copyright (c) 2015 thcomp. All rights reserved.
//  Version 1.1
//

import Foundation

public class HttpConnection: NSObject {
    private static let TAG: String = "HttpConnection";
    private static let ConnectionTimeout: UInt64 = 60 * 1000 * 1000 * 1000;
    private static let ConnectionThread: HandlerThread = HandlerThread();
    private var mRequest: NSURLRequest?;
    private var mUrl: NSURL?;
    private var mSemaphoreObject: Semaphore;
    private var mResponse: NSHTTPURLResponse?;
    private var mData: NSData?;

    public override init(){
        super.init();
        mSemaphoreObject = Semaphore();
    }
    
    public func setUrl(url: NSURL){
        mUrl = url;
    }
    
    public func setUrl(urlString urlString: String){
        mUrl = NSURL(string: urlString);
    }

    public func connect(params: HttpRequestParams)->Bool{
        var ret: Bool = false;
        
        if params.uri != nil {
            let request: NSMutableURLRequest = NSMutableURLRequest(URL: params.uri!);
            
            request.HTTPMethod = params.methodType.rawValue;
            if params.requestHeaders != nil {
                request.allHTTPHeaderFields = params.requestHeaders;
            }
            if params.userData != nil {
                request.HTTPBody = params.userData!;
            }
            if params.callback != nil {
                params.callback!.onSendData(request, param: params);
            }
            
            do{
                if #available(iOS 9.0, *) {
                    let session: NSURLSession = NSURLSession();
                    session.dataTaskWithRequest(request, completionHandler: responseHandler);
                    mSemaphoreObject.sleep(HttpConnection.ConnectionTimeout);
                }else{
                    var response: NSURLResponse? = nil;
                    
                    try mData = NSURLConnection.sendSynchronousRequest(request, returningResponse: &response);
                    if response != nil {
                        mResponse = response as? NSHTTPURLResponse;
                    }
                }
            } catch {
                LogUtil.e(HttpConnection.TAG, content: "NSURLConnection.sendSynchronousRequest throws error");
            }
            if mResponse != nil {
                ret = true;
            }

            if params.callback != nil {
                params.callback!.onReceiveData(ret, response: mResponse, param: params);
            }
        }
        
        return ret;
    }
    
    @available(iOS, deprecated=1.1, message="use connectWithHttpRequestParams")
    public func connect()->Bool{
        return connect(nil, requestHeaders: nil, entity: nil);
    }
    
    @available(iOS, deprecated=1.1, message="use connectWithHttpRequestParams")
    public func connect(method: String?, requestHeaders: Dictionary<String, String>?, entity: NSData?)->Bool{
        var ret: Bool = false;
        
        if mUrl != nil {
            let request: NSMutableURLRequest = NSMutableURLRequest(URL: mUrl!);
            
            if method != nil {
                request.HTTPMethod = method!;
            }
            if requestHeaders != nil {
                request.allHTTPHeaderFields = requestHeaders;
            }
            if entity != nil {
                request.HTTPBody = entity!;
            }
            
            do{
                if #available(iOS 9.0, *) {
                    let session: NSURLSession = NSURLSession();
                    session.dataTaskWithRequest(request, completionHandler: responseHandler);
                    mSemaphoreObject.sleep(HttpConnection.ConnectionTimeout);
                }else{
                    var response: NSURLResponse? = nil;
                    
                    try mData = NSURLConnection.sendSynchronousRequest(request, returningResponse: &response);
                    if response != nil {
                        mResponse = response as? NSHTTPURLResponse;
                    }
                }
            } catch {
                LogUtil.e(HttpConnection.TAG, content: "NSURLConnection.sendSynchronousRequest throws error");
            }
            if mResponse != nil {
                ret = true;
            }
        }
        
        return ret;
    }
    
    public func connectAsync(params: HttpRequestParams) {
        let connectHandler: Handler = HttpConnection.ConnectionThread.getHandler();
        let connectRunnable: ConnectRunnable = ConnectRunnable(httpConnection: self);
        connectRunnable.requestParams(params);
        connectHandler.post(connectRunnable);
    }
    
    public func responseHandler(data: NSData?, response: NSURLResponse?, error: NSError?)->Void{
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), {
            self.mResponse = response as? NSHTTPURLResponse;
            self.mData = data;
            
            self.mSemaphoreObject.signal();
        });
    }
    
    public func getResponse()->NSURLResponse?{
        return mResponse;
    }

    public func getData()->NSData?{
        return mData;
    }
    
    internal class ConnectRunnable : Runnable {
        private let mHttpConnection: HttpConnection;
        private var mRequestParams: HttpRequestParams?;

        internal init(httpConnection: HttpConnection){
            mHttpConnection = httpConnection;
        }
        
        internal func requestParams(params: HttpRequestParams) -> ConnectRunnable{
            mRequestParams = params;
            return self;
        }
        
        internal func run() {
            let connectionResult: Bool = mHttpConnection.connect(mRequestParams!);
            if let callback: HttpConnectionCallback = mRequestParams?.callback {
                callback.onReceiveData(connectionResult, response: mHttpConnection.mResponse, param: mRequestParams!);
            }
        }
    }
}
