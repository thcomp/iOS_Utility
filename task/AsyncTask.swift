//
//  AsyncTask.swift
//
//  Created by thcomp on 8/29/15.
//  Copyright (c) 2015 thcomp. All rights reserved.
//

import Foundation

public class AsyncTask: NSOperation{
    static let TaskResultOK: Int = 0;
    static let TaskResultNG: Int = -1;
    static let TaskResultCanceled: Int = -2;
    
    internal var mCallback: TaskCallback?;
    internal var mParams: [AnyObject] = [];
    internal var mResult: AnyObject? = nil;
    
    init(callback: TaskCallback?){
        mCallback = callback;
    }
    
    func execute(params: AnyObject...){
        if params.count > 0 {
            for param: AnyObject in params {
                mParams.append(param);
            }
        }

        if var _: TaskCallback = mCallback {
            if NSThread.currentThread().isMainThread {
                onPreExecute();
            }else{
                NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                    self.onPreExecute();
                })
            }
        }

        NSOperationQueue().addOperationWithBlock { () -> Void in
            self.mResult = self.doInBackground(self.mParams);
            
            if let _: TaskCallback = self.mCallback {
                NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                    self.onPostExecute();
                })
            }
        }
    }

    func onPreExecute(){
        if let callback: TaskCallback = mCallback {
            callback.onPreExecute(self);
        }
    }
    
    func doInBackground(params: [AnyObject]?)->AnyObject{
        return AsyncTask.TaskResultNG;
    }
    
    func onPostExecute(){
        if let callback: TaskCallback = mCallback {
            callback.onPostExecute(self, result: mResult!);
        }
    }

}
