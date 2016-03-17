//
//  Semaphore.swift
//
//  Created by thcomp on 2015/11/28.
//  Copyright © 2015年 thcomp. All rights reserved.
//

import Foundation

public class Semaphore{
    private let mSemaphoreObject: dispatch_semaphore_t;

    public init(){
        mSemaphoreObject = dispatch_semaphore_create(0)
    }
    
    public func lock() -> Bool {
        if numericCast(objc_sync_enter(mSemaphoreObject)) == OBJC_SYNC_SUCCESS {
            return true;
        }else{
            return false;
        }
    }

    public func unlock() -> Bool {
        if numericCast(objc_sync_exit(mSemaphoreObject)) == OBJC_SYNC_SUCCESS {
            return true;
        }else{
            return false;
        }
    }
    
    public func sleep(interval: UInt64) {
        dispatch_semaphore_wait(mSemaphoreObject, interval);
    }
    
    public func signal() {
        dispatch_semaphore_signal(mSemaphoreObject);
    }
}