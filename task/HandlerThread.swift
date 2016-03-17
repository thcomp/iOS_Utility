//
//  HandlerThread.swift
//
//  Created by thcomp on 2016/02/18.
//  Copyright © 2016年 thcomp. All rights reserved.
//

import Foundation

public class HandlerThread {
    private var mOperationQueue: NSOperationQueue;
    
    public convenience init(){
        self.init(name: "", qos: NSQualityOfService.Background);
    }
    
    public convenience init(name: String, qos: NSQualityOfService){
        mOperationQueue = NSOperationQueue();
        mOperationQueue.name = name;
        mOperationQueue.qualityOfService = qos;
    }
    
    public init(operationQueue: NSOperationQueue){
        mOperationQueue = operationQueue;
    }
    
    public func getHandler() -> Handler {
        return Handler(operationQueue: mOperationQueue);
    }
}